from elftools.elf.elffile import ELFFile
from contextlib import ExitStack
import struct
from elftools.dwarf.dwarfinfo import DebugSectionDescriptor
import os
import subprocess
import sys

def get_debuglink(elf, section_name='.gnu_debuglink'):
    section = elf.get_section_by_name(section_name)
    if section is None:
        return None, None
    data = section.data()
    end = data.find(b'\0')
    return data[:end].decode(), data[-4:]

def get_alt_string(attr, alt_debug_info):
    if attr.form == 'DW_FORM_GNU_strp_alt':
        return alt_debug_info.get_string_from_table(attr.raw_value)
    else:
        return attr.value

def get_missing_associated_files(f):
    libpaths = []
    ld_so_config = subprocess.check_output(['/sbin/ldconfig', '-Nv'],
                                           universal_newlines=True,
                                           stderr=subprocess.DEVNULL)
    for l in ld_so_config.splitlines():
        if l.startswith('\t'):
            continue
        libpaths.append(l.split(':', 1)[0])

    yield from get_missing_associated_files_rec(f, set(), libpaths)

def get_missing_associated_files_rec(f, visited, default_libpaths):
    f = os.path.realpath(f)
    if f in visited:
        return
    visited.add(f)
    with ExitStack() as stack:
        try:
            fd = stack.enter_context(open(f, 'rb'))
        except FileNotFoundError:
            yield f
            return

        elf = ELFFile(fd)

        dynamic = elf.get_section_by_name('.dynamic')
        if dynamic and dynamic['sh_type'] == 'SHT_DYNAMIC':
            needed = []
            def all_rpaths():
                for tag in dynamic.iter_tags('DT_RPATH'):
                    for rpath in tag.rpath.split(':'):
                        yield rpath
                for tag in dynamic.iter_tags('DT_RUNPATH'):
                    for rpath in tag.runpath.split(':'):
                        yield rpath

            assert f == os.path.realpath(f)
            ORIGIN = os.path.dirname(f)

            def fixed_rpaths():
                for rpath in all_rpaths():
                    rpath = rpath.replace('$ORIGIN', ORIGIN)
                    if os.path.isabs(rpath):
                        yield rpath

            libpaths = []
            for rpath in fixed_rpaths():
                libpaths.append(rpath)
            libpaths.extend(default_libpaths)

            for tag in dynamic.iter_tags('DT_NEEDED'):
                for libpath in libpaths:
                    try:
                        path = os.path.join(libpath, tag.needed)
                        needed_fd = stack.enter_context(open(path, 'rb'))
                    except FileNotFoundError:
                        continue
                    needed_elf = ELFFile(needed_fd)
                    if elf['e_machine'] != needed_elf['e_machine'] and elf.little_endian == needed_elf.little_endian:
                        sys.stderr.write("ELF ident not matching {} and {}. Skipping.\n".format(path, f))
                        continue
                    # FIXME: propagate correctly RPATH.
                    yield from get_missing_associated_files_rec(path, visited, default_libpaths)
                    break

        debug_link = get_debuglink(elf, '.gnu_debuglink')[0]

        if debug_link:
            dirname = os.path.dirname(os.path.realpath(f))
            debug_link = os.path.join('/usr/lib/debug',
                                      os.path.relpath(dirname, '/'),
                                      debug_link)
            yield from get_missing_associated_files_rec(debug_link, visited, default_libpaths)
        debug_alt_link = get_debuglink(elf, '.gnu_debugaltlink')[0]
        if debug_alt_link:
            try:
                alt_fd = stack.enter_context(open(debug_alt_link, 'rb'))
            except FileNotFoundError:
                yield debug_alt_link
                return
            alt_elf = ELFFile(alt_fd)
            if alt_elf.has_dwarf_info():
                alt_dwarf_info = alt_elf.get_dwarf_info()
        else:
            alt_dwarf_info = None

        if not elf.has_dwarf_info():
            return

        dwarf_info = elf.get_dwarf_info()

        if dwarf_info.debug_abbrev_sec:
            # FIXME: Report bug
            dwarf_info.debug_abbrev_sec = DebugSectionDescriptor(
                stream=dwarf_info.debug_abbrev_sec.stream,
                name=dwarf_info.debug_abbrev_sec.name,
                global_offset=dwarf_info.debug_abbrev_sec.global_offset,
                size=dwarf_info.debug_abbrev_sec.stream.tell(),
                address=dwarf_info.debug_abbrev_sec.address)
            assert dwarf_info.debug_abbrev_sec.size == dwarf_info.debug_abbrev_sec.stream.tell()

        for cu in dwarf_info.iter_CUs():
            for die in cu.iter_DIEs():
                if 'DW_AT_comp_dir' in die.attributes and 'DW_AT_name' in die.attributes:
                    comp_dir = get_alt_string(die.attributes['DW_AT_comp_dir'],
                                              alt_dwarf_info).decode()
                    name = get_alt_string(die.attributes['DW_AT_name'],
                                          alt_dwarf_info).decode()
                    yield os.path.normpath(os.path.join(comp_dir, name))

if __name__ == '__main__':
    import sys
    for f in get_missing_associated_files(sys.argv[1]):
        print(f)

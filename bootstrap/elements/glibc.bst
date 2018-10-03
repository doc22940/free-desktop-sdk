kind: autotools
description: GNU C Library

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: gcc-stage1.bst
  type: build
- filename: debugedit-host.bst
  type: build

sysroots:
- path: /sysroot
  depends:
  - filename: linux-headers.bst
  - filename: cross-installation-links.bst

config:
  configure-commands:
    - |
      mkdir "%{builddir}"
      cd "%{builddir}"
      echo slibdir=%{multiarch_libdir} >configparms
      echo gconvdir=%{multiarch_libdir}/gconv >>configparms
      echo rootsbindir=%{sbindir} >>configparms
      echo sbindir=%{sbindir} >>configparms
      ../%{configure}

  install-commands:
    (>):
    # Because sysconfdir has to be set as /etc for ldconfig, we need
    # manually move /etc/rpc
    - |
      mkdir -p "%{install-root}%{prefix}/etc"
      mv "%{install-root}%{sysconfdir}/rpc" "%{install-root}%{prefix}/etc/rpc"
      rm -r "%{install-root}%{sysconfdir}"

    # Move /lib* links into the prefix.
    - |
      root="%{install-root}"
      for i in lib lib32 lib64; do
        libdir="${root}/${i}"
        targetdir="${root}%{prefix}/${i}"
        if [ -d "${libdir}" ]; then
          for f in "${libdir}"/*; do
            if [ -h "$f" ]; then
              [ -d "${targetdir}" ] || mkdir -p "${targetdir}"
              targetpath="${targetdir}/$(basename "$f")"
              sourcepath="${libdir}/$(readlink "$f")"
              relsourcepath="$(realpath "${sourcepath}" --relative-to="${targetdir}")"
              ln -s "${relsourcepath}" "${targetpath}"
              rm "$f"
            fi
          done
          rm -r "${libdir}"
          ln -s "$(realpath "${targetdir}" --relative-to="${root}")" "${libdir}"
        fi
      done

    - |
      %{delete_libtool_files}

environment:
  CPPFLAGS: ""
  CFLAGS: "-O2 -g"
  CXXFLAGS: "-O2 -g"
  LDFLAGS: ""

variables:
  # flatpak places ld.so.conf in /etc and not /usr/etc.
  sysconfdir: "/etc"

  multiarch_libdir: "%{prefix}/lib/%{gcc_triplet}"
  lib: "lib"

  host-triplet: "%{triplet}"
  build-triplet: "%{guessed-triplet}"
  conf-local: |
    --with-headers=/sysroot%{includedir}

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/*.o"
          - "%{libdir}/lib*.a"
          - "%{libdir}/libdl.so"
          - "%{libdir}/libnsl.so"
          - "%{libdir}/libBrokenLocale.so"
          - "%{libdir}/libthread_db.so"
          - "%{libdir}/librt.so"
          - "%{libdir}/libcrypt.so"
          - "%{libdir}/libnss_dns.so"
          - "%{libdir}/libanl.so"
          - "%{libdir}/libnss_files.so"
          - "%{libdir}/libresolv.so"
          - "%{libdir}/libmvec.so"
          - "%{libdir}/libcidn.so"
          - "%{libdir}/libnss_hesiod.so"
          - "%{libdir}/libnss_db.so"
          - "%{libdir}/libutil.so"
          - "%{libdir}/libnss_compat.so"
          - "%{libdir}/libm.so"

sources:
- kind: tar
  url: ftp_gnu_org:glibc/glibc-2.27.tar.xz
  ref: 5172de54318ec0b7f2735e5a91d908afe1c9ca291fec16b5374d9faadfc1fc72
- kind: patch
  path: patches/glibc-reorder-end.patch

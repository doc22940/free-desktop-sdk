import argparse
import sys
from dbus.mainloop.glib import DBusGMainLoop
from gi.repository import GLib
import dbus
from .files import get_missing_associated_files
import os

def raw_string(s):
    return [c for c in s.encode()]+[0]

def main():
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('paths', metavar='PATH', nargs='+',
                        help='Paths to fetch')

    args = parser.parse_args()
    DBusGMainLoop(set_as_default=True)
    main_loop = GLib.MainLoop()

    bus = dbus.SessionBus()
    flatpak_portal_obj = bus.get_object('org.freedesktop.portal.Flatpak',
                                       '/org/freedesktop/portal/Flatpak')

    flatpak_portal = dbus.Interface(flatpak_portal_obj,
                                    dbus_interface='org.freedesktop.portal.Flatpak')

    last_not_found = set()
    while True:
        not_found = set()
        for path in args.paths:
            for f in get_missing_associated_files(path):
                r = os.path.relpath(f, '/usr/lib/debug')
                not_found.add(r)
        if not_found == last_not_found:
            break
        flatpak_portal.GetDebugFiles([raw_string(s) for s in not_found])
        last_not_found = not_found

if __name__ == '__main__':
    sys.exit(main())

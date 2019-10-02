kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/glib.bst
- filename: components/gtk3.bst

- filename: vm/eos-updater/libdaemon.bst
- filename: vm/eos-updater/pygobject.bst
- filename: vm/eos-updater/python3-dbus.bst
- filename: vm/eos-updater/xmltoman.bst
  type: build

variables:
  conf-local: >-
    --with-distro=none
    --disable-qt3
    --disable-qt4
    --disable-gtk
    --enable-gtk3
    --disable-python
    --disable-mono

sources:
- kind: git_tag
  url: github:lathiat/avahi.git
  track: master
  ref: v0.7-0-g6242e5f0fe001b7de2ccaa9431db279b2ee76b83
- kind: patch
  path: patches/avahi/gettext.patch

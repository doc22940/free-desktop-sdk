kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gtk3.bst
- filename: components/itstools.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --disable-webkitgtk

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{datadir}/help"

sources:
- kind: tar
  url: https://download.gnome.org/sources/zenity/3.30/zenity-3.30.0.tar.xz

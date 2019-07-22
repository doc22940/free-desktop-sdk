kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/glib.bst
- filename: components/flex.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: --disable-valadoc

sources:
- kind: tar
  url: https://download.gnome.org/sources/vala/0.44/vala-0.44.1.tar.xz

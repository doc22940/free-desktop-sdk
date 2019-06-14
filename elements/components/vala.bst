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
  url: https://download.gnome.org/sources/vala/0.44/vala-0.44.3.tar.xz
  ref: 8553b422484af88be1685d8b47f7b0df36ae4477c3e77e89ab22276ffed1eae9

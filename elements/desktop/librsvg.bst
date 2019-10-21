kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: extensions/rust/rust.bst
  type: build
- filename: desktop/vala.bst
  type: build
- filename: desktop/gdk-pixbuf.bst
- filename: desktop/pango.bst
- filename: desktop/cairo.bst
- filename: desktop/libcroco.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: desktop/gtk-doc.bst
  type: build
- filename: desktop/gobject-introspection.bst
  type: build

variables:
  conf-local: |
    --enable-gtk-doc \
    --enable-vala

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/librsvg-2.so'

environment:
  PATH: /usr/bin:/usr/lib/sdk/rust/bin

sources:
- kind: tar
  url: https://download.gnome.org/sources/librsvg/2.46/librsvg-2.46.2.tar.xz
  ref: 379ec0bbf9ce249c2bc03f4a124d8f532abe0916d908c5cf26821e5af1668197

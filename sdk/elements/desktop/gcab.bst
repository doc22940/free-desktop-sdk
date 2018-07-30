kind: meson

depends:
  - filename: bootstrap-import.bst
  - filename: base/meson.bst
    type: build
  - filename: base/ninja.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/glib.bst

variables:
  meson-local: |
    -Dinstrospection=false

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgcab-1.0.so"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/gcab/1.0/gcab-1.0.tar.xz
    ref: 297401e74f9e4b13510acc62c2b7600264f60efe22369fee625ee16e2f9228ca

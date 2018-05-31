kind: meson

depends:
  - filename: bootstrap-import.bst
  - filename: base/gettext.bst
    type: build
  - filename: base/git.bst
    type: build
  - filename: base/glib.bst
  - filename: desktop/gtk-doc.bst
    type: build
  - filename: base/meson.bst
    type: build
  - filename: base/ninja.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

variables:
  meson-local: |
    -Dintrospection=false

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgcab-1.0.so"

sources:
  - kind: git
    url: https://gitlab.gnome.org/GNOME/gcab
    ref: e00b3959de71394bae726f834af1be8255cece3b #  v1.1

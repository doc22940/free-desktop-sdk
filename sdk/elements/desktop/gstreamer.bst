kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/gobject-introspection.bst
- filename: base/meson.bst
  type: build
- filename: base/ninja.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/flex.bst
  type: build
- filename: base/bison.bst
  type: build

variables:
  meson-local: |
    -Ddisable_examples=true

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libgstcheck-1.0.so"
        - "%{libdir}/libgstbase-1.0.so"
        - "%{libdir}/libgstnet-1.0.so"
        - "%{libdir}/libgstreamer-1.0.so"
        - "%{libdir}/libgstcontroller-1.0.so"

sources:
- kind: git
  url: freedesktop:gstreamer/gstreamer
  track: '1.14'
  ref: d6c697e7d9585a48a2cfed793b72155bb8e5ad5b   # 1.14.0
  submodules:
    common:
      url: freedesktop:gstreamer/common

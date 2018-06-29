kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/orc.bst
- filename: desktop/gstreamer.bst
- filename: desktop/gstreamer-plugins-base.bst
- filename: base/meson.bst
  type: build
- filename: base/ninja.bst
  type: build
- filename: base/pkg-config.bst
  type: build

variables:
  meson-local: |
    -Duse_orc=yes

sources:
- kind: git
  url: freedesktop:gstreamer/gst-plugins-good
  track: '1.14'
  ref: e8f8cd2ce02442f359415013e853afc098c75d22   # 1.14.0
  submodules:
    common:
      url: freedesktop:gstreamer/common

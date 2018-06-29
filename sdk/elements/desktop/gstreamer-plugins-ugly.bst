kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/gstreamer.bst
- filename: desktop/gstreamer-plugins-base.bst
- filename: base/meson.bst
  type: build
- filename: base/ninja.bst
  type: build
- filename: base/pkg-config.bst
  type: build

sources:
- kind: git
  url: freedesktop:gstreamer/gst-plugins-ugly
  track: '1.14'
  ref: 005effc365d48964271a7a028d62e5e13da976d3   # 1.14.0
  submodules:
    common:
      url: freedesktop:gstreamer/common

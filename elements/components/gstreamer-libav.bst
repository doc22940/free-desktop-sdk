kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/orc.bst
- filename: components/gstreamer.bst
- filename: components/gstreamer-plugins-base.bst
- filename: components/ffmpeg.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/nasm.bst
  type: build

variables:
  meson-local: |
    '-Dc_args=-DTRIPLET=\"%{gcc_triplet}\"'

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-libav
  track: '1.16'
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
- kind: patch
  path: patches/gstreamer-libav/gst-libav-stop-caching-codecs.patch

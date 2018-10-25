kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/orc.bst
  - filename: desktop/gstreamer.bst
  - filename: desktop/gstreamer-plugins-base.bst
  - filename: desktop/ffmpeg.bst
    type: build
  - filename: base/buildsystem-autotools.bst
    type: build
  - filename: base/which.bst
    type: build
  - filename: base/nasm.bst
    type: build

variables:
  conf-local: |
    --with-system-libav

sources:
  - kind: git
    url: freedesktop-old:gstreamer/gst-libav
    track: master
    ref: 9242cad62439eab235a9fa1844bb97f4ae58c9c2 # 1.14.4
    submodules:
      common:
        url: freedesktop-old:gstreamer/common
      gst-libs/ext/libav:
        url: https://git.ffmpeg.org/ffmpeg.git
      gst-libs/ext/gas-preprocessor:
        url: git://git.libav.org/gas-preprocessor.git
  - kind: patch
    path: patches/gst-libav-stop-caching-codecs.patch
  - kind: patch
    path: patches/gst-libav-fix-api.patch

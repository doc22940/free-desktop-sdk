kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/orc.bst
- filename: components/gstreamer.bst
- filename: components/pango.bst
- filename: components/xorg-lib-xv.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/libogg.bst
- filename: components/libtheora.bst
- filename: components/libvorbis.bst
- filename: components/opus.bst
- filename: components/mesa-headers.bst

variables:
  meson-local: >-
    -Dgl=enabled
    -Dgl_api=opengl,gles2
    -Dgl_platform=egl,glx
    -Dintrospection=enabled
    -Dogg=enabled
    -Dopus=enabled
    -Dorc=enabled
    -Dpackage-origin="freedesktop-sdk"
    -Dpango=enabled
    -Dtheora=enabled
    -Dvorbis=enabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgstfft-1.0.so'
        - '%{libdir}/libgstrtp-1.0.so'
        - '%{libdir}/libgstsdp-1.0.so'
        - '%{libdir}/libgstvideo-1.0.so'
        - '%{libdir}/libgstapp-1.0.so'
        - '%{libdir}/libgstriff-1.0.so'
        - '%{libdir}/libgstrtsp-1.0.so'
        - '%{libdir}/libgstallocators-1.0.so'
        - '%{libdir}/libgsttag-1.0.so'
        - '%{libdir}/libgstaudio-1.0.so'
        - '%{libdir}/libgstpbutils-1.0.so'
        - '%{libdir}/libgstgl-1.0.so'

sources:
- kind: git_tag
  url: freedesktop:gstreamer/gst-plugins-base
  track: '1.16'
  submodules:
    common:
      checkout: true
      url: freedesktop:gstreamer/common
- kind: git_tag
  url: freedesktop:gstreamer/meson-ports/gl-headers.git
  directory: subprojects/gl-headers
  track: master

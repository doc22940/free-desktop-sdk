kind: meson
description: libdrm

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: desktop/xorg-lib-pciaccess.bst
  type: build

variables:
  prefix: "/usr/lib/%{gcc_triplet}/GL/mesa-git"
  lib: "lib"
  debugdir: "/usr/lib/debug"

  meson-local: -Detnaviv=true -Dtegra=true -Dudev=false
public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libdrm_*.so"
        - "%{libdir}/libdrm.so"
        - "%{libdir}/libkms.so"

sources:
- kind: git_tag
  url: freedesktop:mesa/drm.git
  track: master
  track-tags: false
  ref: libdrm-2.4.97-20-gae836decb41a69d00bfadab78a7cb69f88de4c94

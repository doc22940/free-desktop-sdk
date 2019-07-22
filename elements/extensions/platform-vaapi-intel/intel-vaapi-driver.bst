kind: meson

depends:
- filename: components/libdrm.bst
- filename: components/libva.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: extensions/mesa/libdrm.bst
  type: build

environment:
  PKG_CONFIG_PATH: "/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig:"

variables:
  meson-local: |
    -Ddriverdir="%{libdir}/dri/intel-vaapi-driver"

sources:
- kind: git_tag
  url: github:intel/intel-vaapi-driver
  track: master
- kind: patch
  path: patches/intel-vaapi-driver/intel-vaapi-driver-check-the-interface-from-libva-first.patch
- kind: patch
  path: patches/intel-vaapi-driver/intel-vaapi-driver-properly-check-if-wayland-can-be-used.patch

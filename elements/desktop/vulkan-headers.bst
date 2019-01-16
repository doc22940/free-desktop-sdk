kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes

sources:
- kind: tar
  url: github:KhronosGroup/Vulkan-Headers/archive/v1.1.97.tar.gz
  ref: 662e919e00960adef27e6ee80e7d5bb7d670aa526b2d4596d8ac67b658cd9dc0

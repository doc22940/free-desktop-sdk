kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers
  ref: sdk-1.1.106.0-0-g08cbb5458f692d4778806775f65eb3dc642ddbbf

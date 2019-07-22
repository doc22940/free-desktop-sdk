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
  url: github:KhronosGroup/glslang
  track: master
  exclude:
  - untagged-*
  - master-tot

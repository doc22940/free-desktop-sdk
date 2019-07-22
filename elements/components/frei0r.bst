kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/cairo.bst

sources:
- kind: git_tag
  url: github:dyne/frei0r.git
  track: master
- kind: patch
  path: patches/frei0r/frei0r-Stop-hardcoding-pkgconfig-location.patch

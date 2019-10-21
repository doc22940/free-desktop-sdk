kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/nasm.bst
  type: build

variables:
  meson-local: >-
    -Denable_tests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdav1d.so'

sources:
- kind: git_tag
  url: https://code.videolan.org/videolan/dav1d.git
  track: master
  ref: 0.5.0-0-g5f86e719ec4e24023e30cd61dc080be3ddba1a31

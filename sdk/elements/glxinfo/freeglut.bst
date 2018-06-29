kind: cmake

depends:
- filename: desktop/xorg-lib-xi.bst
  type: build
- filename: desktop/mesa.bst
  type: build
- filename: glxinfo/glu.bst
- filename: base/cmake.bst
  type: build
- filename: base/ninja.bst
  type: build

variables:
  lib: lib
  prefix: /app

  cmake-local: |
    -DFREEGLUT_BUILD_DEMOS:BOOL=OFF

environment:
  CFLAGS: "-O2 -g -fstack-protector-strong -I/app/include"

sources:
- kind: git
  url: https://github.com/dcnieho/FreeGLUT/
  ref: 44cf4b5b85cf6037349c1c8740b2531d7278207d

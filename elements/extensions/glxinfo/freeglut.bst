kind: cmake

depends:
- filename: components/xorg-lib-xi.bst
  type: build
- filename: components/mesa-headers.bst
  type: build
- filename: extensions/glxinfo/glu.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  lib: lib
  prefix: /app

  cmake-local: |
    -DFREEGLUT_BUILD_DEMOS:BOOL=OFF \
    -DCMAKE_C_FLAGS="${CFLAGS} -I/app/include"

sources:
- kind: tar
  url: https://prdownloads.sourceforge.net/freeglut/freeglut-3.0.0.tar.gz

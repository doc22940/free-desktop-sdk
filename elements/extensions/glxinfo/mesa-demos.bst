kind: autotools

depends:
- filename: components/xorg-lib-xi.bst
  type: build
- filename: components/mesa-headers.bst
  type: build
- filename: components/freetype.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: extensions/glxinfo/glu.bst
- filename: extensions/glxinfo/glew.bst
- filename: extensions/glxinfo/freeglut.bst

variables:
  prefix: /app
  lib: lib
  builddir: ''
  conf-local: |
    --enable-osmesa=no

environment:
  PKG_CONFIG_PATH: '/app/lib/pkgconfig:'

sources:
- kind: git_tag
  url: freedesktop:mesa/demos.git
  track: master

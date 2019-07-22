kind: autotools

depends:
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/mesa-headers.bst
  type: build

variables:
  prefix: /app
  lib: lib

sources:
- kind: git_tag
  url: freedesktop:mesa/glu.git
  track: master

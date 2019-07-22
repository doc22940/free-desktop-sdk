kind: autotools

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/tools-lib-path.bst
  type: runtime

(@): elements/bootstrap/build.yml

variables:
  prefix: '%{tools}'
  lib: lib

config:
  configure-commands:
    (<):
      - autoreconf -ivf

sources:
- kind: git_tag
  url: github:file/file
  track: master

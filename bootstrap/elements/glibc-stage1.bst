kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build

(@): build.yml

variables:
  prefix: /glibc
  sysconfdir: /glibc/etc
  localstatedir: /glibc/var
  lib: lib

  conf-local: |
    --disable-werror

sources:
- kind: git_tag
  url: sourceware:glibc.git
  track: master
  ref: glibc-2.29-0-g330c9d0db1ff29f2f0c2b3561f39539836fbeed5

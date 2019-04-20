kind: autotools

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build

(@): elements/bootstrap/build.yml

variables:
  prefix: /glibc
  sysconfdir: /glibc/etc
  localstatedir: /glibc/var
  lib: lib

  conf-local: |
    --disable-werror

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{libexecdir}/getconf"

    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_tag
  url: sourceware:glibc.git
  track: release/2.29/master
  ref: glibc-2.29-0-g56c86f5dd516284558e106d04b92875d5b623b7a

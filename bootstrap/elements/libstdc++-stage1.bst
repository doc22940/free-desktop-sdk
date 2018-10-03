kind: autotools
description: GNU C Library

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: gcc-stage1.bst
  type: build

sysroots:
- path: /sysroot
  depends:
  - filename: glibc.bst

variables:
  lib: "lib"

  host-triplet: "%{triplet}"
  build-triplet: "%{guessed-triplet}"
  conf-local: |
      --enable-multiarch \
      --disable-nls \
      --disable-multilib

config:
  configure-commands:
    - |
      mkdir "%{builddir}"
      cd "%{builddir}"
      ../libstdc++-v3/%{configure}

environment:
  CPPFLAGS: ""
  CFLAGS: "-O2 -g"
  CXXFLAGS: "-O2 -g"
  LDFLAGS: ""

sources:
- kind: tar
  url: ftp_gnu_org:gcc/gcc-8.2.0/gcc-8.2.0.tar.xz
  ref: 196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080

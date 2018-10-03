kind: autotools
description: GNU Binutils

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: debugedit-host.bst
  type: build

sysroots:
- path: /sysroot
  depends:
  - filename: glibc.bst

variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{triplet}"
  conf-local: |
    --disable-werror \
    --with-lib-path="%{libdir}:%{indep-libdir}" \
    --enable-gold \
    --enable-ld=default \
    --enable-shared \
    --enable-plugins

environment:
  LEXLIB: " "

sources:
- kind: tar
  url: https://sourceware.org/pub/binutils/releases/binutils-2.31.tar.xz
  ref: 231036df7ef02049cdbff0681f4575e571f26ea8086cf70c2dcd3b6c0f4216bf

public:
  bst:
    split-rules:
      devel:
        - "/**"

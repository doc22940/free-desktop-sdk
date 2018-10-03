kind: autotools
description: GNU findutils

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

sources:
- kind: tar
  url: ftp_gnu_org:findutils/findutils-4.6.0.tar.gz
  ref: ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d

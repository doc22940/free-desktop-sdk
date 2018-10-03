kind: autotools
description: GNU sed

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
  url: ftp_gnu_org:sed/sed-4.5.tar.xz
  ref: 7aad73c8839c2bdadca9476f884d2953cdace9567ecd0d90f9959f229d146b40

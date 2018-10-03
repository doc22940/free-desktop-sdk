kind: autotools
description: GNU awk

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
  url: ftp_gnu_org:gawk/gawk-4.2.1.tar.xz
  ref: d1119785e746d46a8209d28b2de404a57f983aa48670f4e225531d3bdc175551

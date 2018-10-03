kind: autotools
description: zlib

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
  conf-args: |
    --prefix=%{prefix} \
    --sharedlibdir=%{libdir} \
    --libdir=%{libdir}

environment:
  CHOST: "%{triplet}"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libz.so"

sources:
  - kind: tar
    url: https://zlib.net/zlib-1.2.11.tar.xz
    ref: 4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066

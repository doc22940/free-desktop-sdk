kind: autotools
description: GNU coreutils

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
  - filename: acl.bst
  - filename: coreutils-manpages.bst
    type: build

variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{triplet}"
  conf-local: |
    --enable-install-program=hostname \
    --enable-no-install-program=kill,uptime \
    --enable-acl

  make-install: make -j1 DESTDIR="%{install-root}" install INSTALL=install

config:
  build-commands:
    (<):
      - |
        mkdir -p "%{builddir}/man"
        cp /sysroot%{mandir}/man1/* "%{builddir}/man/"

sources:
- kind: tar
  url: ftp_gnu_org:coreutils/coreutils-8.30.tar.xz
  ref: e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057
- kind: patch
  path: patches/coreutils-no-man-deps.patch

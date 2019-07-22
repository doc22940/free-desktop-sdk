kind: autotools
description: GNU coreutils

(@): elements/bootstrap/build.yml

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build

environment:
  FORCE_UNSAFE_CONFIGURE: 1

variables:
  conf-local: |
    --enable-install-program=hostname \
    --mandir=/coreutils-manpages

config:
  install-commands:
  - |
    cd "%{builddir}"
    make -j1 install-man DESTDIR="%{install-root}"

sources:
- kind: tar
  url: ftp_gnu_org:coreutils/coreutils-8.31.tar.xz

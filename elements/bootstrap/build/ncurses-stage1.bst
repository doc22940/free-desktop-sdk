kind: autotools
description: GNU ncurses stage 1

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build

(@): elements/bootstrap/build.yml

variables:
  prefix: '%{tools}'
  libdir: '%{tools}/lib'
  conf-link-args: --without-shared
  conf-local: |
    --without-ada \
    --with-normal \
    --enable-widec

sources:
- kind: tar
  url: ftp_gnu_org:ncurses/ncurses-6.1.tar.gz
- kind: patch
  path: patches/ncurses/CVE-2018-10754.patch

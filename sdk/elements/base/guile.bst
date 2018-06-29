kind: autotools
description: GNU Guile

depends:
- filename: bootstrap-import.bst
- filename: base/libtool.bst
  type: build
- filename: base/gmp.bst
  type: build
- filename: base/libunistring.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/libffi.bst
  type: build
- filename: base/bdw-gc.bst
  type: build

sources:
- kind: tar
  url: https://ftp.gnu.org/gnu/guile/guile-2.2.3.tar.gz
  ref: 87ee07caef33c97ddc74bf3c29ce7628cfac12061f573e4a29a3a1176754610a
  etag: '"107779b-55f49d2a62aa8"'

kind: autotools
description: GNU autogen

depends:
- filename: bootstrap-import.bst
- filename: base/guile.bst
  type: build

sources:
- kind: tar
  url: https://ftp.gnu.org/gnu/autogen/autogen-5.18.7.tar.gz
  ref: 5d02365f988a3cd97a39cb77ca053f881bfe75fe34dc070ddf7a9afe2a8ec7dd
  etag: '"1b9263-52643f108e314"'

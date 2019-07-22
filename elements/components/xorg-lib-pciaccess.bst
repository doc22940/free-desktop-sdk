kind: autotools
description: X.org lib pciaccess

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpciaccess.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libpciaccess-0.14.tar.bz2

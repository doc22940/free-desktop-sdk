kind: autotools
description: X.org lib xshmfence

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-proto-xorgproto.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxshmfence.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libxshmfence-1.3.tar.bz2

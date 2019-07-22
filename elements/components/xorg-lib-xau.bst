kind: autotools
description: X.org lib Xau

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
        - '%{libdir}/libXau.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXau-1.0.8.tar.bz2

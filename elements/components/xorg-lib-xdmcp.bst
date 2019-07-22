kind: autotools
description: X.org lib xdmcp

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
        - '%{libdir}/libXdmcp.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXdmcp-1.1.2.tar.bz2

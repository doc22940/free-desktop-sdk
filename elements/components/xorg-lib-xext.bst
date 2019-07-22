kind: autotools
description: X.org lib xext

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXext.so'
  cpe:
    product: libxext

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXext-1.3.3.tar.bz2

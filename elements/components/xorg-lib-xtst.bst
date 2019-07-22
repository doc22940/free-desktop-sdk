kind: autotools
description: X.org lib xtst

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: components/xorg-lib-xi.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXtst.so'
  cpe:
    product: libxtst

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXtst-1.2.3.tar.bz2

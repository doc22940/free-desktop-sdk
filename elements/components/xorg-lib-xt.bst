kind: autotools
description: X.org lib Xt

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-sm.bst
- filename: components/xorg-lib-ice.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXt.so'
  cpe:
    product: libxt

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXt-1.1.5.tar.bz2

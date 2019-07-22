kind: autotools
description: X.org lib xi

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: components/xorg-lib-xfixes.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --disable-specs

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXi.so'
  cpe:
    product: libxi

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXi-1.7.9.tar.bz2

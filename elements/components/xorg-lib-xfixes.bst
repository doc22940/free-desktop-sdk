kind: autotools
description: X.org lib xfixes

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
        - '%{libdir}/libXfixes.so'
  cpe:
    product: libxfixes

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXfixes-5.0.3.tar.bz2

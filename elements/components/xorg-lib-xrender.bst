kind: autotools
description: X.org lib xrender

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
        - '%{libdir}/libXrender.so'
  cpe:
    product: libxrender

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXrender-0.9.10.tar.bz2

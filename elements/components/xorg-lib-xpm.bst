kind: autotools
description: X.org lib xpm

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
        - '%{libdir}/libXpm.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXpm-3.5.12.tar.bz2

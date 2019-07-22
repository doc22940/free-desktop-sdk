kind: autotools
description: X.org lib XScrnSaver

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXss.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXScrnSaver-1.2.3.tar.bz2

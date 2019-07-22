kind: autotools
description: X.org xcb-util

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xau.bst
- filename: components/xorg-lib-xcb.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-util.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/xcb/xcb-util-0.4.0.tar.bz2

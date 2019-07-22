kind: autotools
description: X.org xcb-util-wm

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xcb.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-ewmh.so'
        - '%{libdir}/libxcb-icccm.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/xcb/xcb-util-wm-0.4.1.tar.bz2

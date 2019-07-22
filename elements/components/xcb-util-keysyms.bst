kind: autotools
description: X.org xcb-util-keysyms

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
        - '%{libdir}/libxcb-keysyms.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/xcb/xcb-util-keysyms-0.4.0.tar.bz2

kind: autotools
description: X.org xcb-util-renderutil

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
        - '%{libdir}/libxcb-render-util.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/xcb/xcb-util-renderutil-0.3.9.tar.bz2

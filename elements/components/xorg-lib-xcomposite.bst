kind: autotools
description: X.org lib Xcomposite

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xfixes.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXcomposite.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXcomposite-0.4.4.tar.bz2

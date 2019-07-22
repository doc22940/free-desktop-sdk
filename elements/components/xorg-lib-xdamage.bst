kind: autotools
description: X.org lib xdamage

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xfixes.bst
- filename: components/xorg-lib-x11.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXdamage.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXdamage-1.1.4.tar.bz2

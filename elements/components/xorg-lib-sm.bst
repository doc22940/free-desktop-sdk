kind: autotools
description: X.org lib SM

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-ice.bst
- filename: components/xorg-lib-xtrans.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSM.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libSM-1.2.2.tar.bz2

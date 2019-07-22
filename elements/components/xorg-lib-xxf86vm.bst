kind: autotools
description: X.org lib Xxf86vm

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
        - '%{libdir}/libXxf86vm.so'
  cpe:
    product: libxf86vm

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXxf86vm-1.1.4.tar.bz2

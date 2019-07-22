kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xext.bst
- filename: components/xorg-lib-xrender.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXrandr.so'
  cpe:
    product: libxrandr

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXrandr-1.5.1.tar.bz2

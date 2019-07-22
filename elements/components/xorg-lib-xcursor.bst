kind: autotools
description: X.org lib Xcursor

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xrender.bst
- filename: components/xorg-lib-xfixes.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --with-cursorpath=~/.icons:/app/share/icons:%{datadir}/icons:%{datadir}/pixmaps:%{datadir}/runtime/share/icons:/run/host/share/icons

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXcursor.so'
  cpe:
    product: libxcursor

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXcursor-1.1.15.tar.bz2

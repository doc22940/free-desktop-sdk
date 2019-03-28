kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xext.bst
- filename: desktop/xorg-lib-xt.bst

sources:
- kind: tar
  url: https://www.x.org/releases/individual/lib/libXmu-1.1.3.tar.gz
  ref: 5bd9d4ed1ceaac9ea023d86bf1c1632cd3b172dce4a193a72a94e1d9df87a62e

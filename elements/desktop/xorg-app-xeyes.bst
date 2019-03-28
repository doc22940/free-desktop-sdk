kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xext.bst
- filename: desktop/xorg-lib-xt.bst
- filename: desktop/xorg-lib-xmu.bst
- filename: desktop/xorg-lib-xrender.bst


sources:
- kind: tar
  url: https://www.x.org/releases/individual/app/xeyes-1.1.2.tar.gz
  ref: 4a675b34854da362bd8dff4f21ff92e0c19798b128ea0af24b7fc7c5ac2feea3

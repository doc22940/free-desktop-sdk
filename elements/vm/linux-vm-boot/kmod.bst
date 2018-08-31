kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/autoconf.bst
  type: build
- filename: base/automake.bst
  type: build
- filename: base/libtool.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/libxslt.bst
  type: build
- filename: desktop/gtk-doc.bst
  type: build

sources:
- kind: git
  url: https://github.com/lucasdemarchi/kmod
  track: master
  ref: ef4257b59c4307b8c627d89f3c7f1feedb32582f # v24

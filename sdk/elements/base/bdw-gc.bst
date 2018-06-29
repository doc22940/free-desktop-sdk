kind: autotools
description: Boehm-Demers-Weiser C/C++ garbage collector

depends:
- filename: bootstrap-import.bst
- filename: base/autoconf.bst
  type: build
- filename: base/automake.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/libtool.bst
  type: build


sources:
- kind: git
  url: https://github.com/ivmai/bdwgc
  ref: 4685f4de7b4cbbd71dbfa1867635e1e0e790a6d1

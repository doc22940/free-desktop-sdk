kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/python3.bst
    type: build

sources:
  - kind: git
    url: https://anongit.freedesktop.org/git/libevdev.git
    ref: 98d3b0c80e8f2a79cb3e400c1c9e43258334e9e8 # 1.5.9

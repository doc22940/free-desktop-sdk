kind: distutils
description: Python 3

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/python3.bst

sources:
  - kind: git
    url: https://github.com/mesonbuild/meson.git
    track: master
    ref: 36fc65527291553bab6292d4b91208bed5aadda3 

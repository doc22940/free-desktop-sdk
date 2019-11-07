kind: autotools
description: TK

depends:
- filename: bootstrap-import.bst
- filename: components/tcl.bst
- filename: components/xorg-lib-x11.bst

variables:
  conf-cmd: ./unix/configure

sources:
- kind: git_tag
  url: github:tcltk/tk.git
  track: master
  ref: core-8-6-9-1-0-g28c0241a6bb6b806bfc2094ed2c41e24c9887952

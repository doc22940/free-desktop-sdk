kind: autotools
description: X.org proto xcb

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

sources:
- kind: tar
  url: https://xcb.freedesktop.org/dist/xcb-proto-1.13.tar.bz2

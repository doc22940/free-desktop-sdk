kind: autotools
description: json2bst conversion of xorg-x11-proto-composite
depends:
- autoconf-archive.bst
- meson.bst
- xorg-x11-util-macros.bst
- xorg-x11-proto-bigreqs.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/compositeproto-0.4.2.tar.bz2
  ref: 049359f0be0b2b984a8149c966dd04e8c58e6eade2a4a309cf1126635ccd0cfc
config:
  configure-commands:
  - '%{configure} '

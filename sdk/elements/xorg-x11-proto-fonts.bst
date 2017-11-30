kind: autotools
description: json2bst conversion of xorg-x11-proto-fonts
depends:
- base.bst
- autoconf-archive.bst
- meson.bst
- xorg-x11-util-macros.bst
- xorg-x11-proto-bigreqs.bst
- xorg-x11-proto-composite.bst
- xorg-x11-proto-damage.bst
- xorg-x11-proto-dmx.bst
- xorg-x11-proto-evieext.bst
- xorg-x11-proto-fixes.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/fontsproto-2.1.3.tar.bz2
  ref: 259046b0dd9130825c4a4c479ba3591d6d0f17a33f54e294b56478729a6e5ab8

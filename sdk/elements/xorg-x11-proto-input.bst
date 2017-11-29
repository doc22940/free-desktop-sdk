kind: autotools
description: json2bst conversion of xorg-x11-proto-input
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
- xorg-x11-proto-fonts.bst
- xorg-x11-proto-gl.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/inputproto-2.3.2.tar.bz2
  ref: 893a6af55733262058a27b38eeb1edc733669f01d404e8581b167f03c03ef31d
config:
  configure-commands:
  - '%{configure} '

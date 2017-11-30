kind: autotools
description: json2bst conversion of xorg-x11-proto-kb
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
- xorg-x11-proto-input.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/kbproto-1.0.7.tar.bz2
  ref: f882210b76376e3fa006b11dbd890e56ec0942bc56e65d1249ff4af86f90b857

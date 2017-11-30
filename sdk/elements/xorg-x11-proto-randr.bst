kind: autotools
description: json2bst conversion of xorg-x11-proto-randr
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
- xorg-x11-proto-kb.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/randrproto-1.5.0.tar.bz2
  ref: 4c675533e79cd730997d232c8894b6692174dce58d3e207021b8f860be498468

kind: autotools
description: json2bst conversion of xorg-x11-proto-render
depends:
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
- xorg-x11-proto-randr.bst
- xorg-x11-proto-record.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/renderproto-0.11.1.tar.bz2
  ref: 06735a5b92b20759204e4751ecd6064a2ad8a6246bb65b3078b862a00def2537
config:
  configure-commands:
  - '%{configure} '

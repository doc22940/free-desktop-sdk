kind: autotools
description: json2bst conversion of xorg-x11-proto-resource
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
- xorg-x11-proto-randr.bst
- xorg-x11-proto-record.bst
- xorg-x11-proto-render.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/resourceproto-1.2.0.tar.bz2
  ref: 3c66003a6bdeb0f70932a9ed3cf57cc554234154378d301e0c5cfa189d8f6818
config:
  configure-commands:
  - '%{configure} '

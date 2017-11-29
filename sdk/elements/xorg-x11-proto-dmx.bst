kind: autotools
description: json2bst conversion of xorg-x11-proto-dmx
depends:
- autoconf-archive.bst
- meson.bst
- xorg-x11-util-macros.bst
- xorg-x11-proto-bigreqs.bst
- xorg-x11-proto-composite.bst
- xorg-x11-proto-damage.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/dmxproto-2.3.1.tar.bz2
  ref: e72051e6a3e06b236d19eed56368117b745ca1e1a27bdc50fd51aa375bea6509
config:
  configure-commands:
  - '%{configure} '

kind: autotools
description: json2bst conversion of xorg-x11-proto-record
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
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/recordproto-1.14.2.tar.bz2
  ref: a777548d2e92aa259f1528de3c4a36d15e07a4650d0976573a8e2ff5437e7370
config:
  configure-commands:
  - '%{configure} '

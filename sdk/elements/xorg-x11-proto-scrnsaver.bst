kind: autotools
description: json2bst conversion of xorg-x11-proto-scrnsaver
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
- xorg-x11-proto-resource.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/scrnsaverproto-1.2.2.tar.bz2
  ref: 8bb70a8da164930cceaeb4c74180291660533ad3cc45377b30a795d1b85bcd65

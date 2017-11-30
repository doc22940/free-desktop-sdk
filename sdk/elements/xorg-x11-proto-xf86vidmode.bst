kind: autotools
description: json2bst conversion of xorg-x11-proto-xf86vidmode
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
- xorg-x11-proto-scrnsaver.bst
- xorg-x11-proto-video.bst
- xorg-x11-proto-xcmisc.bst
- xorg-x11-proto-xext.bst
- xorg-x11-proto-xf86bigfont.bst
- xorg-x11-proto-xf86dga.bst
- xorg-x11-proto-xf86dri.bst
- xorg-x11-proto-xf86misc.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/xf86vidmodeproto-2.3.1.tar.bz2
  ref: 45d9499aa7b73203fd6b3505b0259624afed5c16b941bd04fcf123e5de698770

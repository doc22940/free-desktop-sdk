kind: autotools
description: json2bst conversion of libXau
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
- xorg-x11-proto-xf86vidmode.bst
- xorg-x11-proto-xinerama.bst
- xorg-x11-proto-x.bst
- xorg-x11-proto-xproxymanagement.bst
- xorg-x11-proto-dri2.bst
- xorg-x11-proto-present.bst
- xorg-x11-proto-dri3.bst
- xorg-x11-xtrans-devel.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/lib/libXau-1.0.8.tar.bz2
  ref: fdd477320aeb5cdd67272838722d6b7d544887dfe7de46e1e7cc0c27c2bea4f2

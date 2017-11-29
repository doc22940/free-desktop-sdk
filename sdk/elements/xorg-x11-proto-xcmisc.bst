kind: autotools
description: json2bst conversion of xorg-x11-proto-xcmisc
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
- xorg-x11-proto-render.bst
- xorg-x11-proto-resource.bst
- xorg-x11-proto-scrnsaver.bst
- xorg-x11-proto-video.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/xcmiscproto-1.2.2.tar.bz2
  ref: b13236869372256c36db79ae39d54214172677fb79e9cdc555dceec80bd9d2df
config:
  configure-commands:
  - '%{configure} '

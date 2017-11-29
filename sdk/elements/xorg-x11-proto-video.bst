kind: autotools
description: json2bst conversion of xorg-x11-proto-video
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
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/videoproto-2.3.3.tar.bz2
  ref: c7803889fd08e6fcaf7b68cc394fb038b2325d1f315e571a6954577e07cca702
config:
  configure-commands:
  - '%{configure} '

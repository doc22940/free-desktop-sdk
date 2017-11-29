kind: autotools
description: json2bst conversion of xorg-x11-proto-evieext
depends:
- base.bst
- autoconf-archive.bst
- meson.bst
- xorg-x11-util-macros.bst
- xorg-x11-proto-bigreqs.bst
- xorg-x11-proto-composite.bst
- xorg-x11-proto-damage.bst
- xorg-x11-proto-dmx.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/evieext-1.1.1.tar.bz2
  ref: 1cf74114436d99f56577a90b6438a32ba31b8128c9e63842bb179aba592733fe
config:
  configure-commands:
  - '%{configure} '

kind: autotools
description: json2bst conversion of xorg-x11-proto-damage
depends:
- autoconf-archive.bst
- meson.bst
- xorg-x11-util-macros.bst
- xorg-x11-proto-bigreqs.bst
- xorg-x11-proto-composite.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/damageproto-1.2.1.tar.bz2
  ref: 5c7c112e9b9ea8a9d5b019e5f17d481ae20f766cb7a4648360e7c1b46fc9fc5b
config:
  configure-commands:
  - '%{configure} '

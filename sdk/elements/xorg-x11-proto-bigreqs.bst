kind: autotools
description: json2bst conversion of xorg-x11-proto-bigreqs
depends:
- base.bst
- autoconf-archive.bst
- meson.bst
- xorg-x11-util-macros.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/bigreqsproto-1.1.2.tar.bz2
  ref: 462116ab44e41d8121bfde947321950370b285a5316612b8fce8334d50751b1e
config:
  configure-commands:
  - '%{configure} '

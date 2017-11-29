kind: autotools
description: json2bst conversion of xorg-x11-util-macros
depends:
- autoconf-archive.bst
- meson.bst
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/util/util-macros-1.19.1.tar.bz2
  ref: 18d459400558f4ea99527bc9786c033965a3db45bf4c6a32eefdc07aa9e306a6
config:
  configure-commands:
  - '%{configure} '

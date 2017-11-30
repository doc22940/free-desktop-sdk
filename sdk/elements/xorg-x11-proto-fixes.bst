kind: autotools
description: json2bst conversion of xorg-x11-proto-fixes
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
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/proto/fixesproto-5.0.tar.bz2
  ref: ba2f3f31246bdd3f2a0acf8bd3b09ba99cab965c7fb2c2c92b7dc72870e424ce

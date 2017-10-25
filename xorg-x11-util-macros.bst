kind: autotools
description: json2Bst conversion for xorg-x11-util-macros

depends:
	 - filename: autoconf-archive.bst
	 type: build
	 - filename: meson.bst
	 type: build

sources:
- kind: archive
	 url: http://xorg.freedesktop.org/archive/individual/util/util-macros-1.19.1.tar.bz2
	 sha256: 18d459400558f4ea99527bc9786c033965a3db45bf4c6a32eefdc07aa9e306a6
	 strip-components: 1


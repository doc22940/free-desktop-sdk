kind: autotools
description: json2Bst conversion for xorg-x11-proto-xf86bigfont

depends:
	 - filename: autoconf-archive.bst
	 type: build
	 - filename: meson.bst
	 type: build
	 - filename: xorg-x11-util-macros.bst
	 type: build
	 - filename: xorg-x11-proto-bigreqs.bst
	 type: build
	 - filename: xorg-x11-proto-composite.bst
	 type: build
	 - filename: xorg-x11-proto-damage.bst
	 type: build
	 - filename: xorg-x11-proto-dmx.bst
	 type: build
	 - filename: xorg-x11-proto-evieext.bst
	 type: build
	 - filename: xorg-x11-proto-fixes.bst
	 type: build
	 - filename: xorg-x11-proto-fonts.bst
	 type: build
	 - filename: xorg-x11-proto-gl.bst
	 type: build
	 - filename: xorg-x11-proto-input.bst
	 type: build
	 - filename: xorg-x11-proto-kb.bst
	 type: build
	 - filename: xorg-x11-proto-randr.bst
	 type: build
	 - filename: xorg-x11-proto-record.bst
	 type: build
	 - filename: xorg-x11-proto-render.bst
	 type: build
	 - filename: xorg-x11-proto-resource.bst
	 type: build
	 - filename: xorg-x11-proto-scrnsaver.bst
	 type: build
	 - filename: xorg-x11-proto-video.bst
	 type: build
	 - filename: xorg-x11-proto-xcmisc.bst
	 type: build
	 - filename: xorg-x11-proto-xext.bst
	 type: build

sources:
- kind: archive
	 url: http://xorg.freedesktop.org/archive/individual/proto/xf86bigfontproto-1.2.0.tar.bz2
	 sha256: ba9220e2c4475f5ed2ddaa7287426b30089e4d29bd58d35fad57ba5ea43e1648
	 strip-components: 1


kind: autotools
description: json2Bst conversion for libxcb

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
	 - filename: xorg-x11-proto-xf86bigfont.bst
	 type: build
	 - filename: xorg-x11-proto-xf86dga.bst
	 type: build
	 - filename: xorg-x11-proto-xf86dri.bst
	 type: build
	 - filename: xorg-x11-proto-xf86misc.bst
	 type: build
	 - filename: xorg-x11-proto-xf86vidmode.bst
	 type: build
	 - filename: xorg-x11-proto-xinerama.bst
	 type: build
	 - filename: xorg-x11-proto-x.bst
	 type: build
	 - filename: xorg-x11-proto-xproxymanagement.bst
	 type: build
	 - filename: xorg-x11-proto-dri2.bst
	 type: build
	 - filename: xorg-x11-proto-present.bst
	 type: build
	 - filename: xorg-x11-proto-dri3.bst
	 type: build
	 - filename: xorg-x11-xtrans-devel.bst
	 type: build
	 - filename: libXau.bst
	 type: build
	 - filename: xcb-proto.bst
	 type: build

sources:
- kind: archive
	 url: http://xcb.freedesktop.org/dist/libxcb-1.12.tar.bz2
	 sha256: 4adfb1b7c67e99bc9c2ccb110b2f175686576d2f792c8a71b9c8b19014057b5b
	 strip-components: 1

- kind: file
	 path: pthread-stubs.pc.in

- kind: patch
	 path: libxcb-pthread-stub.patch
	 strip-components: 1
	 use-git: False


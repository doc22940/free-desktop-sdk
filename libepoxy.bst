kind: autotools
description: json2Bst conversion for libepoxy

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
	 - filename: libxcb.bst
	 type: build
	 - filename: libXdmcp.bst
	 type: build
	 - filename: libX11.bst
	 type: build
	 - filename: libXext.bst
	 type: build
	 - filename: libXv.bst
	 type: build
	 - filename: libXfixes.bst
	 type: build
	 - filename: libXdamage.bst
	 type: build
	 - filename: libXi.bst
	 type: build
	 - filename: libXtst.bst
	 type: build
	 - filename: libICE.bst
	 type: build
	 - filename: libSM.bst
	 type: build
	 - filename: libXt.bst
	 type: build
	 - filename: libvdpau.bst
	 type: build
	 - filename: libpciaccess.bst
	 type: build
	 - filename: libdrm.bst
	 type: build
	 - filename: libXxf86vm.bst
	 type: build
	 - filename: libxshmfence.bst
	 type: build
	 - filename: libXpm.bst
	 type: build
	 - filename: libXrender.bst
	 type: build
	 - filename: libXScrnSaver.bst
	 type: build
	 - filename: libXcursor.bst
	 type: build
	 - filename: libXinerama.bst
	 type: build
	 - filename: libXrandr.bst
	 type: build
	 - filename: libXcomposite.bst
	 type: build
	 - filename: xcb-util.bst
	 type: build
	 - filename: xcb-util-image.bst
	 type: build
	 - filename: xcb-util-renderutil.bst
	 type: build
	 - filename: xcb-util-cursor.bst
	 type: build
	 - filename: xcb-util-keysyms.bst
	 type: build
	 - filename: xcb-util-wm.bst
	 type: build
	 - filename: freetype-bootstrap.bst
	 type: build
	 - filename: fontconfig.bst
	 type: build
	 - filename: libXft.bst
	 type: build
	 - filename: glib2.bst
	 type: build
	 - filename: xkeyboard-config.bst
	 type: build
	 - filename: libxkbcommon.bst
	 type: build
	 - filename: llvm.bst
	 type: build
	 - filename: clang.bst
	 type: build
	 - filename: wayland.bst
	 type: build
	 - filename: wayland-protocols.bst
	 type: build
	 - filename: vulkan.bst
	 type: build
	 - filename: libglvnd.bst
	 type: build
	 - filename: mesa.bst
	 type: build
	 - filename: libva.bst
	 type: build
	 - filename: libva-vdpau-driver.bst
	 type: build
	 - filename: dbus.bst
	 type: build
	 - filename: pulseaudio.bst
	 type: build
	 - filename: alsa-lib.bst
	 type: build
	 - filename: alsa-plugins.bst
	 type: build

sources:
- kind: archive
	 url: https://github.com/anholt/libepoxy/archive/1.4.1.tar.gz
	 sha256: da8f42c355b62c2c3ff6bc534c2a24099707b249c2af6eaf8db54b94c364a504
	 strip-components: 1


kind: autotools
description: json2bst conversion of fontconfig
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
- xorg-x11-proto-video.bst
- xorg-x11-proto-xcmisc.bst
- xorg-x11-proto-xext.bst
- xorg-x11-proto-xf86bigfont.bst
- xorg-x11-proto-xf86dga.bst
- xorg-x11-proto-xf86dri.bst
- xorg-x11-proto-xf86misc.bst
- xorg-x11-proto-xf86vidmode.bst
- xorg-x11-proto-xinerama.bst
- xorg-x11-proto-x.bst
- xorg-x11-proto-xproxymanagement.bst
- xorg-x11-proto-dri2.bst
- xorg-x11-proto-present.bst
- xorg-x11-proto-dri3.bst
- xorg-x11-xtrans-devel.bst
- libXau.bst
- xcb-proto.bst
- libxcb.bst
- libXdmcp.bst
- libX11.bst
- libXext.bst
- libXv.bst
- libXfixes.bst
- libXdamage.bst
- libXi.bst
- libXtst.bst
- libICE.bst
- libSM.bst
- libXt.bst
- libvdpau.bst
- libpciaccess.bst
- libdrm.bst
- libXxf86vm.bst
- libxshmfence.bst
- libXpm.bst
- libXrender.bst
- libXScrnSaver.bst
- libXcursor.bst
- libXinerama.bst
- libXrandr.bst
- libXcomposite.bst
- xcb-util.bst
- xcb-util-image.bst
- xcb-util-renderutil.bst
- xcb-util-cursor.bst
- xcb-util-keysyms.bst
- xcb-util-wm.bst
- freetype-bootstrap.bst
sources:
- kind: tar
  url: http://fontconfig.org/release/fontconfig-2.12.5.tar.bz2
  ref: e10ccf1e26b0968f61d81037af1147fea28e86bfd159ffd8cfd5a486da126ce4
- kind: local
  path: fontconfig-flatpak.conf
variables:
  conf-local: ' --disable-static'

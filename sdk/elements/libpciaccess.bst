kind: autotools
description: json2bst conversion of libpciaccess
depends:
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
sources:
- kind: tar
  url: http://xorg.freedesktop.org/archive/individual/lib/libpciaccess-0.13.5.tar.bz2
  ref: 752c54e9b3c311b4347cb50aea8566fa48eab274346ea8a06f7f15de3240b999
config:
  configure-commands:
  - '%{configure}  \ --disable-static'

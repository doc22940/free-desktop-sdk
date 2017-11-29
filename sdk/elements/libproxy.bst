kind: autotools
description: json2bst conversion of libproxy
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
- fontconfig.bst
- libXft.bst
- glib2.bst
- xkeyboard-config.bst
- libxkbcommon.bst
- llvm.bst
- clang.bst
- wayland.bst
- wayland-protocols.bst
- vulkan.bst
- libglvnd.bst
- mesa.bst
- libva.bst
- libva-vdpau-driver.bst
- dbus.bst
- pulseaudio.bst
- alsa-lib.bst
- alsa-plugins.bst
- libepoxy.bst
- itstool.bst
- desktop-file-utils.bst
- shared-mime-info.bst
- hicolor-icon-theme.bst
- pixman.bst
- cairo.bst
- graphite2.bst
- harfbuzz.bst
- freetype.bst
sources:
- kind: tar
  url: http://pkgs.fedoraproject.org/repo/pkgs/libproxy/libproxy-0.4.14.tar.xz/sha512/610d5d8ffb812efd75541a8da2b2ab5882529364b3e736f26c57fba57183464b531f84d04bdc73fabd4d3899a63b909db59ead81081d55753386da511e5381b3/libproxy-0.4.14.tar.xz
  ref: e25d046850346a505c0617646f1e68b660092efadf665548a89c280900262ea6
config:
  configure-commands:
  - '%{configure}  \ -DCMAKE_C_FLAGS_RELEASE:STRING=-DNDEBUG \ -DCMAKE_CXX_FLAGS_RELEASE:STRING=-DNDEBUG
    \ -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \ -DCMAKE_INSTALL_PREFIX:PATH=/usr \ -DINCLUDE_INSTALL_DIR:PATH=/usr/include
    \ -DLIB_INSTALL_DIR:PATH=/usr/lib \ -DSYSCONF_INSTALL_DIR:PATH=/etc \ -DSHARE_INSTALL_PREFIX:PATH=/usr/share
    \ -DBUILD_SHARED_LIBS:BOOL=ON \ -DMODULE_INSTALL_DIR=/usr/lib/libproxy/0.4.11/modules
    \ -DWITH_PERL=OFF \ -DWITH_GNOME3=OFF'

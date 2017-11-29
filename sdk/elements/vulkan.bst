kind: autotools
description: json2bst conversion of vulkan
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
sources:
- kind: tar
  url: https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/archive/sdk-1.0.57.0.tar.gz
  ref: ef0c065fa8e5fd496459208c089362bd079989ba519af236c6784b38221a88f0
config:
  configure-commands:
  - '%{configure}  \ -DCMAKE_INSTALL_LIBDIR=lib \ -DCMAKE_BUILD_TYPE=Release \ -DCMAKE_SKIP_RPATH:BOOL=yes
    \ -DBUILD_VKJSON=OFF \ -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc \ -DBUILD_WSI_MIR_SUPPORT=OFF
    \ -DGLSLANG_SPIRV_INCLUDE_DIR=./ \ -DBUILD_TESTS=OFF \ -DBUILD_DEMOS=OFF \ -DBUILD_LAYERS=OFF'

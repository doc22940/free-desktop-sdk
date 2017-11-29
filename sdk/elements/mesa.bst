kind: autotools
description: json2bst conversion of mesa
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
- vulkan.bst
- libglvnd.bst
sources:
- kind: tar
  url: https://mesa.freedesktop.org/archive/mesa-17.0.7.tar.xz
  ref: f6d75304a229c8d10443e219d6b6c0c342567dbab5a879ebe7cfa3c9139c4492
- kind: patch
  path: mesa-EGL-Implement-the-libglvnd-interface-for-EGL-v2.patch
- kind: patch
  path: mesa-fixup-EGL-Implement-the-libglvnd-interface-for-EGL-v.patch
- kind: patch
  path: mesa-glvnd-fix-gl-dot-pc.patch
- kind: patch
  path: mesa-Fix-linkage-against-shared-glapi.patch
- kind: patch
  path: mesa-dri-path.patch
config:
  configure-commands:
  - '%{configure}  \ --enable-libglvnd \ --disable-selinux \ --disable-osmesa \ --with-dri-driverdir=/usr/lib/dri
    \ --enable-egl \ --disable-gles1 \ --enable-gles2 \ --disable-xvmc \ --with-egl-platforms=x11,drm,surfaceless,wayland
    \ --enable-shared-glapi \ --enable-gbm \ --disable-opencl \ --enable-glx-tls \
    --enable-texture-float=yes \ --enable-gallium-llvm \ --enable-llvm-shared-libs
    \ --enable-dri \ --enable-sysfs'

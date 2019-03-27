kind: meson

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/nettle.bst
- filename: base/libtirpc.bst
- filename: base/krb5.bst
  type: build
- filename: desktop/libepoxy.bst
- filename: desktop/pixman.bst
- filename: desktop/xorg-lib-xkbfile.bst
- filename: desktop/xorg-lib-xfont2.bst
- filename: desktop/xorg-lib-xdmcp.bst
- filename: desktop/xorg-app-xkbcomp.bst
- filename: desktop/xorg-font-util.bst
- filename: desktop/wayland.bst
- filename: desktop/wayland-protocols.bst
- filename: desktop/systemd.bst

variables:
  meson-local: |
    -Dxvfb=false \
    -Dxnest=false \
    -Dxwin=false \
    -Dglamor=true \
    -Dxwayland=true

sources:
- kind: tar
  url: https://www.x.org/archive/individual/xserver/xorg-server-1.20.4.tar.gz
  ref: a6447de89eca3e22eeead682b325d902779569534ad83388c9e16611d72baaf3

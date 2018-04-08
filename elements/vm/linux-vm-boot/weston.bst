kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/libunwind.bst
  - filename: base/linux-pam.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: desktop/cairo.bst
  - filename: desktop/libdrm.bst
  - filename: desktop/mesa.bst
  - filename: desktop/wayland.bst
  - filename: desktop/wayland-protocols.bst
  - filename: desktop/xorg-lib-xcb.bst
  - filename: desktop/xorg-lib-xcursor.bst
  - filename: vm/linux-vm-boot/systemd.bst
  - filename: vm/linux-vm-boot/mtdev.bst
  - filename: vm/linux-vm-boot/libinput.bst

variables:
  conf-local: |
    --disable-setuid-install

sources:
  - kind: git
    url: https://gitlab.freedesktop.org/wayland/weston.git
    track: 5.0
    ref: 5.0.0-0-g030e7d40fe18869880fc72ce9ae3cbeca6f49600

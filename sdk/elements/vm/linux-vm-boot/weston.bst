kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: desktop/libdrm.bst
  - filename: desktop/mesa.bst
  - filename: desktop/wayland.bst
  - filename: desktop/xorg-lib-xcb.bst
  - filename: desktop/xorg-lib-xcursor.bst
  - filename: desktop/cairo.bst
  - filename: vm/linux-vm-boot/systemd.bst
  - filename: vm/linux-vm-boot/mtdev.bst
  - filename: vm/linux-vm-boot/libinput.bst
  - filename: vm/linux-vm-boot/pam.bst

variables:
  conf-local: |
    --disable-setuid-install

sources:
  - kind: git
    url: git://anongit.freedesktop.org/wayland/weston
    track: 3.0
    ref: 2a528187b2cc33414611a28d9baf1125f7cd4607 # 3.0.0

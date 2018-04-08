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
  - filename: base/glib.bst
  - filename: vm/linux-vm-boot/systemd.bst
  - filename: vm/linux-vm-boot/libgudev.bst

sources:
  - kind: git
    url: git://git.code.sf.net/p/linuxwacom/libwacom
    ref: 9ff640d455f1419b1a9505d2e02651c133c99fa1 # 0.29

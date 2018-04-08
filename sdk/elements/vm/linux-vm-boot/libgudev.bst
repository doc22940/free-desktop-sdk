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
  - filename: base/which.bst
    type: build
  - filename: base/python3.bst
    type: build
  - filename: base/glib.bst
  - filename: base/util-linux.bst
  - filename: vm/linux-vm-boot/systemd.bst
  - filename: vm/linux-vm-boot/gnome-common.bst
    type: build
  - filename: desktop/gtk-doc.bst
    type: build

# umockdev depends on vala and is recursively dependent on libgudev.
# Only useful for testing.
variables:
  conf-local: |
    --disable-umockdev

sources:
  - kind: git
    url: https://github.com/GNOME/libgudev.git
    ref: 58eb745d8c4fb06b35706c2c997313235dccb1fc # 232

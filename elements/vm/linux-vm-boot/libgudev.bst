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
  - filename: base/pkg-config.bst
    type: build
  - filename: base/glib.bst
  - filename: base/util-linux.bst
  - filename: vm/linux-vm-boot/systemd.bst
  - filename: desktop/gtk-doc.bst
    type: build

# umockdev depends on vala and is recursively dependent on libgudev.
# Only useful for testing.
variables:
  conf-local: |
    --disable-umockdev

sources:
  - kind: git
    url: https://gitlab.gnome.org/GNOME/libgudev.git
    ref: 1a0d84217294bb356d6b4df9366ef921a590d421 #  232-6-g1a0d842

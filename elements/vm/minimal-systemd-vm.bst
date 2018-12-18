kind: compose

public:
  bst:
    split-rules:
      docs:
      - '%{datadir}/runtime/docs/**'
      locale:
      - '%{datadir}/runtime/locale/**'

(?):
  - enable_systemd == False:
      (!): |
        Systemd must be enabled in options

depends:
- filename: vm/base-filesystem.bst
  type: build
- filename: bootstrap-import.bst
  type: build
- filename: base/util-linux.bst
  type: build
- filename: vm/bsp-generic.bst
  type: build
- filename: vm/initramfs/initramfs-gz.bst
  type: build
- filename: vm/linux-vm-boot/systemd.bst
  type: build
- filename: vm/linux-vm-boot/shadow.bst
  type: build
- filename: desktop/dbus.bst
  type: build


config:
  include:
  - runtime

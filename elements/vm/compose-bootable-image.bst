kind: compose

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/util-linux.bst
  type: build
- filename: vm/bsp-generic/linux.bst
  type: build
- filename: desktop/systemd.bst
  type: build
- filename: desktop/dbus.bst
  type: build
- filename: vm/bsp-generic/dracut.bst
  type: build
- filename: desktop/os-release.bst
  type: build
- filename: vm/linux-vm-boot/shadow.bst
  type: build
- filename: base/tzdata.bst
  type: build

config:
  exclude:
  - debug
  - devel
  include-orphans: True

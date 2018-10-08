kind: stack
description: Deployment tooling

depends:
  - filename: base.bst
  - filename: fastboot/ext4-tools/android-tools-fsutils.bst
  - filename: base/libselinux.bst
  - filename: vm/linux-vm-boot/systemd.bst

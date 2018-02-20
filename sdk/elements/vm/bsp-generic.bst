kind: stack
description: |
  Linux kernel and any platform specific components required for booting.

depends:
- vm/linux-vm-boot/linux.bst

(?):
  - target_arch in ["i586", "x86_64"]:
      depends:
        (>):
          - vm/linux-vm-boot/syslinux.bst

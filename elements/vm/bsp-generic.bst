kind: stack
description: |
  Linux kernel and any platform specific components required for booting.

depends:
- vm/bsp-generic/linux.bst
- vm/bsp-generic/grub.bst
(?):
  - target_arch in ["i586", "x86_64"]:
      depends:
        (>):
          - vm/bsp-generic/syslinux.bst

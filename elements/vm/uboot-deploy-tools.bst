kind: stack
description: Deployment tooling

depends:
- base.bst
- vm/uboot/uboot-tools.bst
- fastboot/bootimg-tools/libfdt.bst
- vm/qemu.bst
- desktop/pixman.bst

kind: stack
description: Deployment tooling

depends:
- base/e2fsprogs.bst
- base/tzdata.bst
- base/cpio.bst
- base/gzip.bst
- vm/deploy-tools/dosfstools.bst
- vm/deploy-tools/mtools.bst
- vm/deploy-tools/parted.bst
- vm/linux-vm-boot/systemd.bst
- vm/linux-vm-boot/kmod.bst
- vm/linux-vm-boot/dracut.bst
- vm/bsp-generic/syslinux.bst
- vm/bsp-generic/grub.bst

public:
  bst:
    integration-commands:
      - |
        cat > /usr/etc/group << EOF  # Hack to configure systemd correctly
        cdrom:x:11:                   # Dracut seems to always configure via 
        tape:x:33:                    # the actual root directory, with no way to change
        dialout:x:18:
        floppy:x:19:
        systemd-journal:x:101:
        utmp:x:43:
        EOF


kind: script

depends:
- filename: vm/linux-vm-boot/dracut.bst
  type: build
- filename: vm/bsp-generic.bst
  type: build
- filename: base/util-linux.bst
  type: build
- filename: vm/linux-vm-boot/kmod.bst
  type: build

config:
  commands:
    - |
      mkdir -p /var/tmp
      mkdir /initramfs
      dracut /initramfs/freedesktop-sdk.img --kver 4.16.8 --prefix /boot --gzip

kind: x86image
description: Create a deployment of the minimal image
depends:
- filename: vm/minimal-vm.bst
  type: build
- filename: vm/deploy-tools.bst
  type: build

variables:
  # Size of the disk to create
  #
  # Should be able to calculate this based on the space
  # used, however it must be a multiple of (63 * 512) bytes
  # as mtools wants a size that is devisable by sectors (512 bytes)
  # per track (63).
  #
  # This is the smallest boot partition I managed to make.
  boot-size: 38912K

  rootfs-size: 100M
  sector-size: 512
  swap-size: 40K

  kernel-args: root=/dev/sda2 rootfstype=ext4 init=/bin/sh console=ttyS0

config:
  base: vm/deploy-tools.bst
  input: vm/minimal-vm.bst

  filesystem-tree-setup-commands:
    - |
      mkdir -p %{build-root}/dev
      mkdir -p %{build-root}/proc

    - |
      cd /buildstream
      mkdir -p /buildstream/boot

    - |
      # Generate an fstab
      cat > %{build-root}/etc/fstab << EOF
      /dev/sda2   /       ext4   defaults,rw,noatime   0 1
      /dev/sda1   /boot   vfat   defaults              0 2
      /dev/sda3   none    swap   defaults              0 0
      EOF

    - |
      # Generate initramfs with dracut
      mkdir -p %{build-root}/var/tmp
      depmod -a -b %{build-root} "4.16.8";
      dracut /buildstream/boot/initramfs.gz 4.16.8 --kmoddir "%{build-root}/lib/modules/4.16.8" --gzip 

    - |
      mv %{build-root}/boot/* buildstream/boot

    - |
      # Create syslinux config
      mkdir -p /buildstream/boot/syslinux
      cat > /buildstream/boot/syslinux/syslinux.cfg << EOF
      PROMPT 0
      TIMEOUT 5

      ALLOWOPTIONS 1
      SERIAL 0 115200

      DEFAULT boot
      LABEL boot

      KERNEL /vmlinuz
      INITRD /initramfs.gz

      APPEND %{kernel-args}
      EOF

  final-commands:
    (>):
    - |
      cat > %{install-root}/run-in-qemu.sh << EOF
      #!/bin/sh
      qemu-system-x86_64 -drive file=sda.img,format=raw -nographic -m 256
      EOF
      chmod +x %{install-root}/run-in-qemu.sh

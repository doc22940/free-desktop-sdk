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

  rootfs-size: 500M
  sector-size: 512
  swap-size: 40K

  kernel-args: root=/dev/sda2 rootfstype=ext4 console=ttyS0 rd.shell rd.debug

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
      mv %{build-root}/boot/* /buildstream/boot

    - |
      # Generate an fstab
      cat > %{build-root}/etc/fstab << EOF
      /dev/sda2   /       ext4   defaults,rw,noatime,acl   0 1
      /dev/sda1   /boot   ext4   defaults,acl              0 2
      /dev/sda3   none    swap   defaults                  0 0
      EOF

    - |
      # Generate user group information
      # systemd-journal requires a user group to run
      cat > %{build-root}/usr/etc/group << EOF
      cdrom:x:11
      tape:x:33
      dialout:x:18
      floppy:x:19
      systemd-journal:x:101
      EOF

    - |
      # Generate initramfs with dracut
      mkdir -p %{build-root}/var/tmp
      depmod -a -b %{build-root} "4.16.8"
      cd %{build-root}
      dracut /buildstream/boot/initramfs.gz 4.16.8 --kmoddir "%{build-root}/lib/modules/4.16.8" --local --gzip  --prefix /boot --add-fstab %{build-root}/etc/fstab --tmpdir %{build-root}/var/tmp  --include %{build-root}/sbin/swapon /sbin/swapon  --include %{build-root}/usr/etc/group /usr/etc/group

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

    - |
      systemd-firstboot --root %{build-root} --root-password root --locale en_US.UTF-8 --timezone UTC
      chmod 400 %{build-root}/etc/shadow

  filesystem-image-creation-commands:
    - |
      # Create /boot image
      truncate -s %{boot-size} /buildstream/sda1.img
      mkfs.ext4 -F -i 8192 -L boot -d /buildstream/boot /buildstream/sda1.img

    - |
      syslinux --directory /syslinux/ /buildstream/sda1.img

    - |
      truncate -s %{rootfs-size} /buildstream/sda2.img
      mkfs.ext4 -F -i 8192 -L root -d %{build-root} /buildstream/sda2.img

    - |
      truncate -s %{swap-size} /buildstream/sda3.img
      mkswap -L swap /buildstream/sda3.img

  partition-commands:
    - |
      sda1size=$(stat -c "%s" /buildstream/sda1.img | head -c -1)
      sda2size=$(stat -c "%s" /buildstream/sda2.img | head -c -1)
      sda3size=$(stat -c "%s" /buildstream/sda3.img | head -c -1)

      sda1sec=$(( ${sda1size} / %{sector-size} ))
      sda2sec=$(( ${sda2size} / %{sector-size} ))
      sda3sec=$(( ${sda3size} / %{sector-size} ))

      sda1offset=1
      sda2offset=$(( ${sda1offset} + ${sda1sec} ))
      sda3offset=$(( ${sda2offset} + ${sda2sec} ))

      sdasectors=$(( ${sda3offset} + ${sda3sec} ))
      sdabytes=$(( ${sdasectors} * %{sector-size} ))

      truncate -s ${sdabytes} /buildstream/sda.img
      parted -s /buildstream/sda.img mklabel gpt
      parted -s /buildstream/sda.img unit s mkpart primary ext2 ${sda1offset} $(( ${sda1offset} + ${sda1sec} - 1 ))
      parted -s /buildstream/sda.img unit s mkpart primary ext2 ${sda2offset} $(( ${sda2offset} + ${sda2sec} - 1 ))
      parted -s /buildstream/sda.img unit s mkpart primary linux-swap ${sda3offset} $(( ${sda3offset} + ${sda3sec} - 1 ))

      parted -s /buildstream/sda.img set 1 boot on

      dd if=/buildstream/sda1.img of=/buildstream/sda.img \
          ibs=%{sector-size} obs=%{sector-size} conv=notrunc \
          count=${sda1sec} seek=${sda1offset}

      dd if=/buildstream/sda2.img of=/buildstream/sda.img \
          ibs=%{sector-size} obs=%{sector-size} conv=notrunc \
          count=${sda2sec} seek=${sda2offset}

      dd if=/buildstream/sda3.img of=/buildstream/sda.img \
          ibs=%{sector-size} obs=%{sector-size} conv=notrunc \
          count=${sda3sec} seek=${sda3offset}


  final-commands:
    (>):
    - |
      cat > %{install-root}/run-in-qemu.sh << EOF
      #!/bin/sh
      qemu-system-x86_64 -drive file=sda.img,format=raw -nographic -m 256
      EOF
      chmod +x %{install-root}/run-in-qemu.sh

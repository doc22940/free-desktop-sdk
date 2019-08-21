kind: x86image
description: Create a deployment of the minimal image
depends:
- filename: vm/minimal-systemd-vm.bst
  type: build
- filename: vm/deploy-tools.bst
  type: build

variables:
  # For OSTree
  ROOTFS: '%{build-root}'
  REPO: '%{install-root}/repo'
  BRANCH: "freedesktop-systemd"

  # For create_deployment.sh
  OSNAME: "fdsdk-os"
  BOOTLOADER: "syslinux"
  # The ostree remote to configure. This will be used
  # later to get updates to the system. Make sure you
  # change this to point to your OSTree repository.
  OSTREE_REMOTE_NAME: "fdsdk-origin"
  OSTREE_REMOTE_URL: "http://192.168.1.10:8000/repo"
  OSTREE_BRANCH: '%{BRANCH}'
  # Create the ostree sysroot (using 'install-root' because 'build-root' wouldn't work)
  OSTREE_SYSROOT: '%{install-root}/sysroot'
  OSTREE_SYSROOT_REPO: '%{OSTREE_SYSROOT}/ostree/repo'
  OSTREE_SYSROOT_BOOT: '%{OSTREE_SYSROOT}/boot'

  # Size of the disk to create
  #
  # Should be able to calculate this based on the space
  # used, however it must be a multiple of (63 * 512) bytes
  # as mtools wants a size that is devisable by sectors (512 bytes)
  # per track (63).
  #
  # This is the smallest boot partition I managed to make.
  boot-size: 38912K

  rootfs-size: 700M
  sector-size: 512
  swap-size: 40K

  kernel-args: root=/dev/sda2 rootfstype=ext4 console=ttyS0 rw

config:
  base: vm/deploy-tools.bst
  input: vm/minimal-systemd-vm.bst

  filesystem-tree-setup-commands:
    - |
      # Set some setuid/setgid binaries, since BuildStream still does not
      # support persisting these attributes in the artifacts, we need to
      # do it at the last minute when creating the image.
      chmod 4755 %{ROOTFS}/usr/bin/su
      chmod 4755 %{ROOTFS}/usr/bin/passwd
      chmod 4755 %{ROOTFS}/usr/bin/gpasswd
      chmod 4755 %{ROOTFS}/usr/bin/chsh
      chmod 4755 %{ROOTFS}/usr/bin/chfn
      chmod 4755 %{ROOTFS}/usr/bin/newgrp
      chmod 4755 %{ROOTFS}/usr/bin/mount
      chmod 4755 %{ROOTFS}/usr/bin/umount
      chmod 2755 %{ROOTFS}/usr/bin/expiry
      chmod 2755 %{ROOTFS}/usr/bin/chage
      chmod 4755 %{ROOTFS}/usr/bin/sudo

    # Create os-release file
    - |
      cat >%{ROOTFS}/usr/lib/os-release <<'EOF'
      NAME="Freedesktop-Nano"
      VERSION="v1"
      ID=freedesktop
      ID_LIKE=freedesktop
      PRETTY_NAME="Freedesktop Nano v1"
      VERSION_ID="v1"
      HOME_URL="https://freedesktop-sdk.io/"
      VERSION_CODENAME=v1
      EOF

    - |
      # Generate an fstab
      cat > %{ROOTFS}/etc/fstab << EOF
      /dev/sda3   none    swap   defaults              0 0
      EOF


    # Copy kernel to the right place
    - |
      kver=`ls %{ROOTFS}/usr/lib/modules/`
      cp "%{ROOTFS}/boot/vmlinuz" "%{ROOTFS}/usr/lib/modules/$kver/vmlinuz"

    - |
      if [ -d "%{ROOTFS}/usr/etc" ]; then
          echo "Non-empty /usr/etc found!"
          exit 1
      fi

    - |
      mv "%{ROOTFS}/etc" "%{ROOTFS}/usr/etc"

      mkdir -p "%{ROOTFS}/sysroot"
      ln -s ../sysroot/ostree "%{ROOTFS}/ostree"

      rm -rf "%{ROOTFS}"/{home,root,media,opt,usr/local}
      ln -s ./var/home "%{ROOTFS}/home"
      ln -s ./var/roothome "%{ROOTFS}/root"
      ln -s ./run/media "%{ROOTFS}/media"
      ln -s ./var/opt "%{ROOTFS}/opt"
      ln -s ./var/local "%{ROOTFS}/usr/local"


      cat >%{ROOTFS}/usr/lib/tmpfiles.d/forostree.conf << 'EOF'
      d /var/log/journal 0755 root root -
      L /var/home - - - - ../sysroot/home
      d /var/opt 0755 root root -
      d /var/srv 0755 root root -
      d /var/roothome 0700 root root -
      d /var/usrlocal 0755 root root -
      d /var/usrlocal/bin 0755 root root -
      d /var/usrlocal/etc 0755 root root -
      d /var/usrlocal/games 0755 root root -
      d /var/usrlocal/include 0755 root root -
      d /var/usrlocal/lib 0755 root root -
      d /var/usrlocal/man 0755 root root -
      d /var/usrlocal/sbin 0755 root root -
      d /var/usrlocal/share 0755 root root -
      d /var/usrlocal/src 0755 root root -
      d /var/mnt 0755 root root -
      d /run/media 0755 root root -
      EOF

    - mkdir -p "%{REPO}"
    - ostree --repo="%{REPO}" init --mode=archive

    - ostree --repo="%{REPO}" commit --branch="%{BRANCH}" "%{ROOTFS}"
    - rm -r "%{ROOTFS}"/*

    # Deployment

    - mkdir -p "%{OSTREE_SYSROOT}"
    - |
      ostree admin init-fs "%{OSTREE_SYSROOT}"
      ostree admin os-init "%{OSNAME}" --sysroot="%{OSTREE_SYSROOT}"

      # Add a remote to the ostree sysroot, so we can pull on the target
      ostree --repo="%{OSTREE_SYSROOT_REPO}" remote add \
          "%{OSTREE_REMOTE_NAME}" "%{OSTREE_REMOTE_URL}" "%{OSTREE_BRANCH}" \
          --no-gpg-verify

    - |
      ostree --repo="%{OSTREE_SYSROOT_REPO}" pull-local \
          "%{REPO}" "%{OSTREE_BRANCH}" --remote="%{OSTREE_REMOTE_NAME}" \
          --disable-fsync

    - |
      case "%{BOOTLOADER}" in
      "syslinux")
          # OSTree will see the syslinux/syslinux.cfg file to
          # recognise the bootloader. An empty file is good
          # enough.
          mkdir -p "%{OSTREE_SYSROOT_BOOT}"/{syslinux,extlinux}
          touch "%{OSTREE_SYSROOT_BOOT}/syslinux/syslinux.cfg"
          ;;
      "uboot")
          mkdir -p "%{OSTREE_SYSROOT_BOOT}/loader.0"
          ln -s loader.0 "%{OSTREE_SYSROOT_BOOT}/loader"
          touch "%{OSTREE_SYSROOT_BOOT}/loader/uEnv.txt"
          ln -s loader/uEnv.txt "%{OSTREE_SYSROOT_BOOT}/uEnv.txt"
          ;;
      "bootloaderspec")
          echo "OSTree creates bootloaderspec config by default"
          ;;
      *)
          echo "Unknown bootloader %{BOOTLOADER}"
          exit 1
      esac

    - |
      # Deploy with root=UUID random
      ostree admin --sysroot="%{OSTREE_SYSROOT}" deploy \
          --os="%{OSNAME}" \
          -v \
          "%{OSTREE_REMOTE_NAME}:%{OSTREE_BRANCH}" \
          --karg-append="%{kernel-args}"

    - |
      case "%{BOOTLOADER}" in
      "syslinux")
          # Create a symlink from syslinux.cf and extlinux.conf
          # To point at the OSTree-generated one.

          rm "%{OSTREE_SYSROOT_BOOT}/syslinux/syslinux.cfg"

          ln -s ../../boot/loader/syslinux.cfg \
              "%{OSTREE_SYSROOT_BOOT}/extlinux/extlinux.conf"

          ln -s ../../boot/loader/syslinux.cfg \
              "%{OSTREE_SYSROOT_BOOT}/syslinux/syslinux.cfg"
          ;;
      *)
          echo "Unknown bootloader %{BOOTLOADER}"
          exit 1
      esac

    - |
      # Organise OSTree generated outputs to leave them
      # as expected by other `x86image` commands.

      # Remove the OSTree repo, use only the sysroot.
      rm -r "%{REPO}"

      # Move OSTree sysroot to the 'build-root' directory.
      mv %{OSTREE_SYSROOT}/* %{build-root}/
      rm -r %{OSTREE_SYSROOT}

      # Move /boot conents to a different folder. It will be
      # later used to populate the 'boot' partition.
      mkdir -p /buildstream/boot
      mv %{build-root}/boot/* /buildstream/boot

  final-commands:
    (>):
    - |
      cat > %{install-root}/run-in-qemu.sh << EOF
      #!/bin/sh
      qemu-system-x86_64 -drive file=sda.img,format=raw -enable-kvm -nographic -m 256
      EOF
      chmod +x %{install-root}/run-in-qemu.sh

kind: x86image
description: Create a deployment of the minimal image
depends:
- filename: vm/minimal-systemd-vm.bst
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

  rootfs-size: 200M
  sector-size: 512
  swap-size: 40K

  kernel-args: root=/dev/sda2 rootfstype=ext4 init=/usr/lib/systemd/systemd console=ttyS0

config:
  base: vm/deploy-tools.bst
  input: vm/minimal-systemd-vm.bst

  filesystem-tree-setup-commands:
    (<):
    - find %{build-root} -type d -exec chmod 755 {} ";"
    - find %{build-root} -type f -perm -u=x -exec chmod 755 {} ";"
    - find %{build-root} -type f -not -perm -u=x -exec chmod 644 {} ";"
    - touch %{build-root}/etc/ld.so.conf
    - mkdir -p %{build-root}/dev
    - mkdir -p %{build-root}/proc
    (>):
    - mv %{build-root}/etc/shadow %{build-root}/etc/shadow.old
    - systemd-firstboot --root %{build-root} --root-password root --locale en_US.UTF-8
      --timezone UTC
    - chmod 0400 %{build-root}/etc/shadow
    - cat %{build-root}/etc/shadow %{build-root}/etc/shadow.old >%{build-root}/etc/shadow.new
    - mv -f %{build-root}/etc/shadow.new %{build-root}/etc/shadow
    - rm -f %{build-root}/etc/shadow.new
    - chmod 0600 %{build-root}/etc/shadow

    - rm "%{build-root}/etc/systemd/system/multi-user.target.wants/machines.target"
    - sed -i "s/enable machines.target/disable machines.target/" "%{build-root}/usr/lib/systemd/system-preset/90-systemd.preset"

  final-commands:
    (>):
    - |
      cat > %{install-root}/run-in-qemu.sh << EOF
      #!/bin/sh
      qemu-system-x86_64 -drive file=sda.img,format=raw -nographic -m 256
      EOF
      chmod +x %{install-root}/run-in-qemu.sh

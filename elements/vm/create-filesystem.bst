kind: script

depends:
- filename: vm/deploy-tools.bst
  type: build
- filename: vm/prepare-bootable-image.bst
  type: build
- filename: vm/compose-bootable-image.bst
  type: build

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6

config:
  layout:
  - element: ''
    destination: '/boot'
  - element: ''
    destination: '/build'
  - element: 'vm/deploy-tools.bst'
    destination: '/'
  - element: 'vm/prepare-bootable-image.bst'
    destination: '/boot'
  - element: 'vm/compose-bootable-image.bst'
    destination: '/sysroot'

  commands:
  - touch /sysroot/etc/ld.so.conf
  - systemd-firstboot --root /sysroot --root-password root --locale en_US.UTF-8 --timezone UTC
  - chmod 0400 /sysroot/etc/shadow

  - uuidgen -s --namespace "%{uuidnamespace}" --name root >/build/uuid-root.txt
  - uuidgen -s --namespace "%{uuidnamespace}" --name boot | tr a-f A-F | sed "s/^\(.......\).*/\1/" >/build/id-boot.txt
  - sed "s/^\(....\)\(....\)$/\1-\2/" /build/id-boot.txt >/build/uuid-boot.txt

  - rm -rf /sysroot/boot/*

  - truncate -s 100M /build/efi.img
  - mkfs.fat -F32 -i $(cat /build/id-boot.txt) -n EFI /build/efi.img
  - mcopy -s -i /build/efi.img /boot/* ::/

  - truncate -s 1G /build/root.img
  - mkfs.ext4 -L root -d /sysroot -U $(cat /build/uuid-root.txt) /build/root.img

  - |
    efisize=$(($(stat -c "%s" /build/efi.img)/512))
    rootsize=$(($(stat -c "%s" /build/root.img)/512))
    truncate -s $(((34+${efisize}+${rootsize}+34)*512)) '%{install-root}/disk.img'
    parted -s '%{install-root}/disk.img' mklabel gpt
    parted -s '%{install-root}/disk.img' unit s mkpart primary fat32 34 $((34+${efisize}-1))
    parted -s '%{install-root}/disk.img' set 1 esp
    parted -s '%{install-root}/disk.img' unit s mkpart primary ext4 $((34+${efisize})) $((34+${efisize}+${rootsize}-1))
    parted -s '%{install-root}/disk.img' print
    dd if=/build/efi.img of='%{install-root}/disk.img' bs=512 seek=34 conv=notrunc
    dd if=/build/root.img of='%{install-root}/disk.img' bs=512 seek=$((34+${efisize})) conv=notrunc

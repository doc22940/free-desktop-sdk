kind: script

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/util-linux.bst
  type: build
- filename: vm/bsp-generic/linux.bst
  type: build
- filename: desktop/systemd.bst
  type: build
- filename: desktop/dbus.bst
  type: build
- filename: vm/bsp-generic/dracut.bst
  type: build
- filename: desktop/os-release.bst
  type: build
- filename: vm/linux-vm-boot/shadow.bst
  type: build
- filename: base/tzdata.bst
  type: build

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  install-root: '/boot'

config:

  layout:
  - element: ''
    destination: '/tmp'
  - element: ''
    destination: '/var/tmp'
  - element: ''
    destination: '/boot'
  - element: bootstrap-import.bst
    destination: '/'
  - element: base/util-linux.bst
    destination: '/'
  - element: vm/bsp-generic/linux.bst
    destination: '/'
  - element: desktop/systemd.bst
    destination: '/'
  - element: desktop/dbus.bst
    destination: '/'
  - element: vm/bsp-generic/dracut.bst
    destination: '/'
  - element: desktop/os-release.bst
    destination: '/'
  - element: vm/linux-vm-boot/shadow.bst
    destination: '/'
  - element: base/tzdata.bst
    destination: '/'

  commands:
  - touch /etc/ld.so.conf
  - systemd-firstboot --root-password root --locale en_US.UTF-8 --timezone UTC

  - uuidgen -s --namespace "%{uuidnamespace}" --name root >/tmp/uuid-root.txt
  - uuidgen -s --namespace "%{uuidnamespace}" --name boot | tr a-f A-F | sed "s/^\(.......\).*/\1/" >/tmp/id-boot.txt
  - sed "s/^\(....\)\(....\)$/\1-\2/" /tmp/id-boot.txt >/tmp/uuid-boot.txt

  - |
    cat <<EOF >/etc/fstab
    UUID=$(cat /tmp/uuid-boot.txt) /boot vfat umask=0077 0 1
    UUID=$(cat /tmp/uuid-root.txt) / ext4 errors=remount-ro 0 1
    EOF

  - dbus-uuidgen >/etc/machine-id
  - SYSTEMD_RELAX_ESP_CHECKS=1 bootctl --path='/boot' --no-variables install
  - rm /etc/machine-id
  - |
    cat <<EOF >/boot/loader/loader.conf
    timeout 10
    editor yes
    console-mode keep
    default *
    EOF

  - |
    dracut --fstab --uefi --uefi-stub /usr/lib/systemd/boot/efi/linuxx64.efi.stub \
           --no-machineid --kernel-image /boot/vmlinuz --kver $(ls -1 /lib/modules | head -n1) \
           --kernel-cmdline "root=UUID=$(cat /tmp/uuid-root.txt) rootfstype=ext4 init=/usr/lib/systemd/systemd console=ttyS0"

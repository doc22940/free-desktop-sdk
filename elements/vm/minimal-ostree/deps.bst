kind: stack

runtime-depends:
- bootstrap-import.bst
- components/util-linux.bst
- components/systemd.bst
- components/dbus.bst
- components/dracut.bst
- components/os-release.bst
- vm/linux-vm-boot/shadow.bst
- components/tzdata.bst
- vm/base-filesystem.bst
- vm/config/journald.bst
- vm/config/networkd.bst
- vm/config/resolved.bst
- vm/config/ostree.bst
- vm/boot/efi-ostree.bst
- components/gnupg.bst

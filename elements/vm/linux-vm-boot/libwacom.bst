kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: public-stacks/buildsystem-autotools.bst
    type: build
  - filename: components/glib.bst
  - filename: components/systemd.bst
  - filename: vm/linux-vm-boot/libgudev.bst

sources:
- kind: git_tag
  url: github:linuxwacom/libwacom.git
  track: master

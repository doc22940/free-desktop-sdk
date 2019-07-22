kind: meson

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: public-stacks/buildsystem-meson.bst
    type: build
  - filename: components/jpeg.bst
  - filename: components/libpng.bst
  - filename: components/gtk3.bst
  - filename: components/systemd.bst
  - filename: vm/linux-vm-boot/mtdev.bst
  - filename: vm/linux-vm-boot/libevdev.bst
  - filename: vm/linux-vm-boot/libwacom.bst

# documentation depends on doxygen
variables:
  meson-local: |
    -Ddocumentation=false \
    -Dtests=false

sources:
  - kind: git_tag
    url: freedesktop:libinput/libinput
    track: master

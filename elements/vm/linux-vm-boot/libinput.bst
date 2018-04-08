kind: meson

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/meson.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: vm/linux-vm-boot/systemd.bst
  - filename: vm/linux-vm-boot/mtdev.bst
  - filename: vm/linux-vm-boot/libevdev.bst
  - filename: vm/linux-vm-boot/libwacom.bst
  - filename: desktop/gtk3.bst
  - filename: base/libpng.bst
  - filename: base/jpeg.bst
  - filename: base/ninja.bst
    type: build

# documentation depends on doxygen
variables:
  meson-local: |
    -Ddocumentation=false \
    -Dtests=false

sources:
  - kind: git
    url: freedesktop:libinput/libinput
    track: master
    ref: 14e47ed2129443833e7a67b38de270355c3822c4 #  1.12.0

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
    url: https://github.com/wayland-project/libinput.git
    track: 1.10-branch
    ref: decfb09027f6f8bdd2313c565a26378db5ef0817 # 1.10.3

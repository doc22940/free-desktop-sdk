kind: make
description: uboot for qemu platforms

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/bison.bst
    type: build
  - filename: base/flex.bst
    type: build
  - filename: base/openssl.bst
    type: build

variables:
  (?):
  - target_arch == "aarch64":
      uboot-config: "qemu_arm64_defconfig"
  - target_arch == "arm":
      uboot-config: "qemu_arm_defconfig"
  - target_arch == "i586" or target_arch == "x86_64":
      uboot-config: "qemu-x86_defconfig"

config:
  build-commands:
    - |
      make "%{uboot-config}"
      make

  install-commands:
    - |
      cp u-boot.bin "%{install-root}"

sources:
- kind: git
  track: v2018.09
  ref: f88b6facb87dc4a52f1630eb9d858c0f54c6628e
  url: git://git.denx.de/u-boot.git

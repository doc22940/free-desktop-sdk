kind: make
description: uboot tools

depends:
  - filename: bootstrap-import.bst
  - filename: base/bison.bst
    type: build
  - filename: base/flex.bst
    type: build
  - filename: base/openssl.bst
    type: build

variables:
  binaries: "%{install-root}/usr/bin"

config:
  build-commands:
    - |
      make sandbox_config tools-only NO_SDL=1

  install-commands:
    - |
      install -d -m 0755 "%{binaries}"
      install tools/mkimage "%{binaries}"
      install tools/mkenvimage "%{binaries}"
      install tools/dumpimage "%{binaries}"

sources:
- kind: git
  track: v2018.09
  ref: f88b6facb87dc4a52f1630eb9d858c0f54c6628e
  url: git://git.denx.de/u-boot.git

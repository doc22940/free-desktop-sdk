kind: manual
description: Skales tools for creating fastboot images

depends:
  - filename: bootstrap-import.bst

variables:
  skales-bins: "%{install-root}/usr/bin"

config:
  install-commands:
    - |
      install -d -m 0755 "%{skales-bins}"
      install ./dtbTool "%{skales-bins}"
      install ./mkbootimg "%{skales-bins}"

sources:
  - kind: git
    url:  git://codeaurora.org/quic/kernel/skales
    track: 1.6.0
    ref:  c2bfa15aa5bfc4e3f1b32de28e327b80b37db1cf


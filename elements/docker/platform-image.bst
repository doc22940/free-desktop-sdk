kind: compose

config:
  exclude:
  - devel
  - extra
  - static
  - debug
  - docs

depends:
- filename: platform.bst
  type: build
- filename: multiarch-platform.bst
  type: build
- filename: platform-manifest.bst
  type: build
- filename: vm/mesa-default.bst
  type: build

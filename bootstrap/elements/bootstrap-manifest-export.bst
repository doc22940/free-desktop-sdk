kind: compose

config:
  include:
  - manifest
  include-orphans: false

depends:
- filename: bootstrap-manifest.bst
  type: build

kind: stackfilter

depends:
- filename: sdk.bst
  type: build

config:
  include-orphans: False
  include:
  - static-whitelist
  pass-integration: False

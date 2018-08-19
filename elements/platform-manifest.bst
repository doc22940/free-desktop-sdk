kind: collect-manifest

config:
  path: "%{prefix}/manifest.json"

depends:
- filename: desktop-platform.bst
  type: build
- filename: bootstrap-manifest.bst
  junction: bootstrap-junction.bst
  type: build

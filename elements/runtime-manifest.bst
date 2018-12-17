kind: collect_manifest

config:
  path: "%{prefix}/manifest.json"

public:
  bst:
    split-rules:
      manifest:
        - "%{prefix}/manifest.json"

depends:
  - filename: desktop.bst

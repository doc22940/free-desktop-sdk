kind: filter

depends:
- filename: extensions/mesa/mesa-base.bst
  type: build

- filename: bootstrap-import.bst
  type: runtime
- filename: components/libdrm.bst
  type: runtime
- filename: components/libva.bst
  type: runtime
- filename: extensions/mesa/libdrm.bst
  type: runtime

config:
  include:
  - gallium-va
  include-orphans: False

kind: split
depends:
- filename: desktop/systemd-base.bst
  type: build

- filename: desktop/libsystemd.bst
  type: runtime
- filename: base/libgpg-error.bst
  type: runtime
- filename: base/util-linux.bst
  type: runtime

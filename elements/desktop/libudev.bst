kind: split
depends:
- filename: desktop/systemd-base.bst
  type: build

- filename: base/libcap.bst
  type: runtime
- filename: base/libgcrypt.bst
  type: runtime
- filename: base/xz.bst
  type: runtime
- filename: desktop/systemd-debugsource.bst
  type: runtime

config:
  prefix: libudev

kind: filter
depends:
- filename: desktop/systemd.bst
  type: build

# Actual dependencies for libsystemd.so
- filename: base/libcap.bst
  type: runtime
- filename: base/libgcrypt.bst
  type: runtime
- filename: base/xz.bst
  type: runtime

config:
  include:
  - lib-only

public:
  bst:
    overlap-whitelist:
    - 'usr/%{lib}/libsystemd.so.*'

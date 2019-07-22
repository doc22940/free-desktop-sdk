kind: stack

(?):
- target_arch == "x86_64":
    depends:
    - extensions/rust/rust-stage1-x86_64.bst
- target_arch == "i686":
    depends:
    - extensions/rust/rust-stage1-i686.bst
- target_arch == "aarch64":
    depends:
    - extensions/rust/rust-stage1-aarch64.bst
- target_arch == "arm":
    depends:
    - extensions/rust/rust-stage1-arm.bst
- target_arch == "powerpc64le":
    depends:
    - extensions/rust/rust-stage1-powerpc64le.bst

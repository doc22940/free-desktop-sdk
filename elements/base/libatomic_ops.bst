kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build


sources:
- kind: git
  url: https://github.com/ivmai/libatomic_ops.git
  ref: b68c654614b5dbec5b71d0250e42e8a3a8b1eda7

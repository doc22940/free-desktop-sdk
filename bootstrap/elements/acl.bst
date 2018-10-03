kind: autotools

depends:
  - filename: dependencies/base-sdk.bst
    type: build
  - filename: gnu-config.bst
    type: build
  - filename: gcc-stage2.bst
    type: build
  - filename: debugedit-host.bst
    type: build

sysroots:
- path: /sysroot
  depends:
  - filename: attr.bst
  - filename: glibc.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libattr.so"
          - "%{libdir}/libacl.so"
          - "%{libexecdir}/libacl.so"

variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{triplet}"

sources:
  - kind: tar
    url: https://download.savannah.nongnu.org/releases/acl/acl-2.2.53.tar.gz
    ref: 06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7

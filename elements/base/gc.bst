kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/libatomic_ops.bst
  type: build


sources:
- kind: tar
  url: https://github.com/ivmai/bdwgc/releases/download/v7.6.10/gc-7.6.10.tar.gz
  ref: 4fc766749a974700c576bbfb71b4a73b2ed746082e2fc8388bfb0b54b636af14

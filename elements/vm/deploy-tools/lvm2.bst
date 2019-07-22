kind: autotools

depends:
- bootstrap-import.bst
- vm/bsp-generic/libaio.bst

sources:
- kind: git_tag
  url: sourceware:lvm2.git
  track: master

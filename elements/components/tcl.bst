kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-cmd: ./unix/configure

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsqlite3.so'

sources:
- kind: git_tag
  url: github:tcltk/tcl
  track: master
  ref: core-8-6-9-0-g54ea3ef1f5f651192316dace49ff9593fcbf6cf0

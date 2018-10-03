kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: file-stage1.bst
  type: build
- filename: debugedit-host.bst
  type: build

sysroots:
- path: /sysroot
  depends:
  - filename: zlib.bst
  - filename: glibc.bst


variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{triplet}"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libmagic.so"

sources:
  - kind: tar
    url: ftp://ftp.astron.com/pub/file/file-5.33.tar.gz
    ref: 1c52c8c3d271cd898d5511c36a68059cda94036111ab293f01f83c3525b737c6

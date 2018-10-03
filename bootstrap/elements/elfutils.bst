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

  - filename: gcc.bst
    type: runtime

sysroots:
- path: /sysroot
  depends:
  - filename: glibc.bst
  - filename: libstdc++-stage1.bst
    type: build
  - filename: bzip2.bst
  - filename: zlib.bst

variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{triplet}"
  conf-local: |
    --without-lzma

config:
  configure-commands:
    (<):
      - |
        autoreconf -f -v -i

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/**"
          - "%{libdir}/libasm.so"
          - "%{libdir}/libdw.so"
          - "%{libdir}/libelf.so"

sources:
- kind: tar
  url: ftp://sourceware.org/pub/elfutils/0.173/elfutils-0.173.tar.bz2
  ref: b76d8c133f68dad46250f5c223482c8299d454a69430d9aa5c19123345a000ff

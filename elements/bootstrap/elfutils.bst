kind: autotools

depends:
- filename: bootstrap/elfutils-build-deps.bst
  type: build
- filename: bootstrap/zlib.bst
  type: runtime
- filename: bootstrap/bzip2.bst
  type: runtime

(@): elements/bootstrap/target.yml

variables:
  conf-local: |
    --without-lzma

config:
  configure-commands:
    (<):
    - |
      autoreconf -f -v -i

  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

public:
  bst:
    split-rules:
      runtime:
        - '%{libdir}/lib*.so.*'

      devel:
        (>):
        - '%{bindir}/**'
        - '%{libdir}/libasm.so'
        - '%{libdir}/libdw.so'
        - '%{libdir}/libelf.so'

sources:
- kind: tar
  url: sourceware_pub:elfutils/0.176/elfutils-0.176.tar.bz2
- kind: patch
  path: patches/elfutils/no-rpath.patch

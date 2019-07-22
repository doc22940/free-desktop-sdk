kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: >-
    --disable-gssapi

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtirpc.so'

sources:
- kind: tar
  url: sourceforge:projects/libtirpc/files/libtirpc/1.1.4/libtirpc-1.1.4.tar.bz2

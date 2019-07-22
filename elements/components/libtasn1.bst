kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtasn1.so'

sources:
- kind: tar
  url: ftp_gnu_org:libtasn1/libtasn1-4.13.tar.gz


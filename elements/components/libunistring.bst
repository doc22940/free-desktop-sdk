kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libunistring.so'

sources:
- kind: tar
  url: ftp_gnu_org:libunistring/libunistring-0.9.10.tar.xz

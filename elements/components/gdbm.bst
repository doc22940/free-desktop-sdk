kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgdbm.so'

sources:
- kind: tar
  url: ftp_gnu_org:gdbm/gdbm-1.16.tar.gz

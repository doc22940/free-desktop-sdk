kind: autotools
description: GNU libtool

depends:
- filename: bootstrap-import.bst
- filename: components/m4.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/*'
        - '%{datadir}/libtool'
        - '%{datadir}/libtool/**'
        - '%{libdir}/libltdl.so'

sources:
- kind: tar
  url: ftp_gnu_org:libtool/libtool-2.4.6.tar.xz

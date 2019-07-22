kind: autotools
description: GNU m4

depends:
- filename: bootstrap-import.bst

sources:
- kind: tar
  url: ftp_gnu_org:m4/m4-1.4.18.tar.xz
- kind: patch
  path: patches/m4/m4-1.4.18-glibc-change-work-around.patch

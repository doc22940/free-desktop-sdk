kind: autotools
description: GNU autoconf

depends:
- filename: bootstrap-import.bst
- filename: components/m4.bst
- filename: components/perl.bst

sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.69.tar.xz

kind: autotools
description: pcre

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    --enable-unicode-properties

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpcre.so'
        - '%{libdir}/libpcrecpp.so'
        - '%{libdir}/libpcreposix.so'

sources:
- kind: tar
  url: https://ftp.pcre.org/pub/pcre/pcre-8.42.tar.bz2

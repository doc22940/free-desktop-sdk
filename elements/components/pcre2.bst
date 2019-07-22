kind: autotools
description: pcre2

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
   --enable-jit

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpcre2-8.so'
        - '%{libdir}/libpcre2-posix.so'

sources:
- kind: tar
  url: https://ftp.pcre.org/pub/pcre/pcre2-10.31.tar.bz2

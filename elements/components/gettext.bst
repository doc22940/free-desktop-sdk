kind: autotools
description: GNU gettext

depends:
- filename: bootstrap-import.bst
- filename: components/gzip.bst
- filename: components/tar.bst
  type: runtime

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgettextsrc.so'
        - '%{libdir}/libgettextlib.so'
        - '%{libdir}/libgettextpo.so'
        - '%{libdir}/libasprintf.so'

  cpe:
    patches:
      - CVE-2018-18751

sources:
- kind: tar
  url: ftp_gnu_org:gettext/gettext-0.19.8.1.tar.xz
- kind: patch
  path: patches/gettext/gettext-reproducible.patch
- kind: patch
  path: patches/gettext/gettext-0.19.8.1-CVE-2018-18751.patch
- kind: patch
  path: patches/gettext/gettext-0.19.8-its-segfault.patch

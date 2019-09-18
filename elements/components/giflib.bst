kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgif.so'

sources:
- kind: tar
  url: sourceforge_download:giflib-5.2.1.tar.bz2
  ref: 70827810a60ec5a1347dad12380c416fa456ebac3ec9d0bd308ca20c031fef2d

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
  url: sourceforge_download:giflib/giflib-5.1.4.tar.bz2

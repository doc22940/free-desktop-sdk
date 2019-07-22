kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfribidi.so'

sources:
- kind: tar
  url: github:fribidi/fribidi/releases/download/v1.0.4/fribidi-1.0.4.tar.bz2

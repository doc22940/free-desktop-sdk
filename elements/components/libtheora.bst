kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libogg.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtheora.so'
        - '%{libdir}/libtheoraenc.so'
        - '%{libdir}/libtheoradec.so'

sources:
- kind: tar
  url: https://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.xz

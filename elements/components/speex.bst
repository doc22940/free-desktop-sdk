kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libogg.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build


variables:
  conf-local: |
    --with-speexdsp \
    --enable-binaries

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libspeex.so'

sources:
- kind: git_tag
  url: https://git.xiph.org/speex.git
  track: master

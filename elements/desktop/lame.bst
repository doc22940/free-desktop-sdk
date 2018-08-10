kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/autoconf.bst
  type: build
- filename: base/automake.bst
  type: build
- filename: base/libtool.bst
  type: build
- filename: base/pkg-config.bst
  type: build

config:
  configure-commands:
    (<):
      - |
        autoconf

  build-commands:
    - make

  install-commands:
    - make -j1 DESTDIR="%{install-root}" install

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libmp3lame.so*"

sources:
- kind: tar
  url: https://sourceforge.net/projects/lame/files/lame/3.100/lame-3.100.tar.gz
  ref: ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e
- kind: patch
  path: patches/lame-3.100.5-pkgconfig-to-get-correct-libs.patch

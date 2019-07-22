kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --enable-dynamic-frontends

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmp3lame.so'

sources:
- kind: tar
  url: sourceforge:projects/lame/files/lame/3.100/lame-3.100.tar.gz
- kind: patch
  path: patches/lame/lame-3.100.5-pkgconfig-to-get-correct-libs.patch

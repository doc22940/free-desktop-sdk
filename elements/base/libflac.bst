kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libogg.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build

variables:
  conf-local: |
    --enable-cpplibs \
    --enable-ogg

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libFLAC.so'
        - '%{libdir}/libFLAC++.so'

sources:
- kind: git_tag
  url: https://git.xiph.org/flac.git
  track: master
  ref: 1.3.2-0-gac39d3719f16dfb6e08d2fbde8ccaf34a266c81d

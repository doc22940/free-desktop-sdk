kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gperf.bst
  type: build
- filename: base/patch.bst
  type: build
- filename: base/texinfo.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libunistring.so'

sources:
- kind: git_tag
  url: savannah:libunistring.git
  track: master
  ref: v0.9.10-0-gf6f4d970296f5d4a7782a33b353b976ca8a68a68
- kind: git_tag
  url: savannah:gnulib.git
  track: master
  ref: v0.1-2524-g4a468b774219eec7e966a68b85074762d3cb4ab6
  directory: gnulib

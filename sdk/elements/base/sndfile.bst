kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/autogen.bst
  type: build
- filename: base/autoconf.bst
  type: build
- filename: base/automake.bst
  type: build
- filename: base/libtool.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/python3.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libsndfile.so"

sources:
- kind: git
  url: https://github.com/erikd/libsndfile
  ref: 1d928bffdb65e827c3e7d17ece0e123b4a70ec6c


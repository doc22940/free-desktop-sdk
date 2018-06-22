kind: autotools

depends:
  - filename: bootstrap-import.bst

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


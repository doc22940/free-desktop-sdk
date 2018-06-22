kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/sndfile.bst

variables:
  conf-local: |
    --enable-sndfile

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libsamplerate.so"

sources:
  - kind: git
    url: https://github.com/erikd/libsamplerate/
    ref: 1d928bffdb65e827c3e7d17ece0e123b4a70ec6c

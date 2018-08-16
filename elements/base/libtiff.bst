kind: autotools

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libtiff.so"
          - "%{libdir}/libtiffxx.so"

  cpe:
    version: 62.1

sources:
  - kind: git
    url: https://gitlab.com/libtiff/libtiff.git
    ref: 020bd2fd3b4235b2175dafa9633d2b191c50e7cd #v4-0-9
    track: Release-v4-0-9

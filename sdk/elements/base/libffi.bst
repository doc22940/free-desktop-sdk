kind: autotools
description: libffi

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libffi.so"

sources:
  - kind: git
    url: https://github.com/libffi/libffi
    ref: 2309b58448b0c8349156d687d7fa8709dfb68992

kind: autotools
description: libffi

depends:
- filename: bootstrap-import.bst
- filename: base/autoconf.bst
  type: build
- filename: base/automake.bst
  type: build
- filename: base/libtool.bst  
  type: build
- filename: base/texinfo.bst
  type: build

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

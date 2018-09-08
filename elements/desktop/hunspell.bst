kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build

variables:
  conf-local: |
    --with-readline \
    --with-ui

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libhunspell-1.6.so"

sources:
  - kind: git
    url: https://github.com/hunspell/hunspell
    track: master
    ref: 2730ad3d32d839f439ba7f286e3600cd9294a978 # v1.6.2

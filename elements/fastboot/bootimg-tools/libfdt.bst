kind: make
description: libfdt library.

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/bison.bst
    type: build
  - filename: base/flex.bst
    type: build


sources:
  - kind: git
    url: https://github.com/dgibson/dtc.git
    track: v1.4.7
    ref: 88f18909db731a627456f26d779445f84e449536


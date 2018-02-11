kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build

sources:
  - kind: git
    url: git://repo.or.cz/nasm.git
    track: nasm-2.13.xx
    ref: ef7d18bfbb899fe8e44f4fae8d6a12e2742f69f5 #  nasm-2.13.03

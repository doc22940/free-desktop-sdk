kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/patch.bst
  type: build
- filename: base/perl.bst
  type: build

config:
  install-commands:
    (>):
      # Dictionaries will be installed by desktop/dictionaries.bst
    - |
      rm -f %{install-root}%{datadir}/hyphen/hyph_en_US.dic

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhyphen.so'

sources:
- kind: tar
  url: https://downloads.sourceforge.net/hunspell/hyphen-2.8.8.tar.gz
  ref: 304636d4eccd81a14b6914d07b84c79ebb815288c76fe027b9ebff6ff24d5705

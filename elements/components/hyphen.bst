kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/patch.bst
  type: build
- filename: components/perl.bst
  type: build

config:
  install-commands:
    (>):
      # Dictionaries will be installed by components/dictionaries.bst
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
  url: sourceforge_download:hunspell/hyphen-2.8.8.tar.gz

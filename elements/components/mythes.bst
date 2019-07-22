kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/hunspell.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmythes-1.2.so'

sources:
- kind: tar
  url: sourceforge_download:hunspell/mythes-1.2.4.tar.gz

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: tar
  url: https://www.x.org/archive/individual/font/font-util-1.3.1.tar.gz

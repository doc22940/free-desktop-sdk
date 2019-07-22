kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-proto-xorgproto.bst

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libfontenc-1.1.4.tar.gz

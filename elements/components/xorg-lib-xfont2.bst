kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/freetype.bst
- filename: components/xorg-lib-fontenc.bst

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXfont2-2.0.3.tar.gz

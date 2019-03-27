kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: desktop/freetype.bst
- filename: desktop/xorg-lib-fontenc.bst

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/libXfont2-2.0.3.tar.gz
  ref: a4b761a37528353a2b83dba364d7c1fd6aef2d554a1a019815f24f7f8866890e

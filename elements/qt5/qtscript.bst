kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt5/qtbase.bst
- filename: base/perl.bst
  type: build
- filename: base/glib.bst
  type: build
- filename: base/icu.bst
  type: build
- filename: base/libpng.bst
  type: build
- filename: base/python3.bst
  type: build
- filename: desktop/freetype.bst
  type: build
- filename: desktop/harfbuzz.bst
  type: build
- filename: desktop/mesa.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/*.so"
sources:
- kind: git
  url: https://code.qt.io/qt/qtscript
  ref: v5.12.0-0-g78be34c5125142a16c117f7508fee603c52cbb36

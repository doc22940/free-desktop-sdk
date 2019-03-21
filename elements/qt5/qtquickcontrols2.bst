kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt5/qtbase.bst
- filename: qt5/qtdeclarative.bst
- filename: base/glib.bst
  type: build
- filename: base/icu.bst
  type: build
- filename: base/libpng.bst
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
  url: https://code.qt.io/qt/qtquickcontrols2
  ref: v5.12.0-0-gd3545dbdfdb30e310c6c962ba92f4fdf57354666

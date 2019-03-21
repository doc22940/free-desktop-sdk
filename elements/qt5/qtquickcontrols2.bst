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
- kind: git_tag
  url: https://code.qt.io/qt/qtquickcontrols2
  track: 5.12
  ref: v5.12.2-0-gca799283a2266b023923286b4928fdf6e7211569

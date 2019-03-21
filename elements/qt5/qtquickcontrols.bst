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

sources:
- kind: git_tag
  url: https://code.qt.io/qt/qtquickcontrols
  track: 5.12
  ref: v5.12.2-0-gc231395eec3494619f4977b4c5cd845b9d7341ae

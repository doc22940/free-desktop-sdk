kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt5/qtbase.bst

sources:
- kind: git
  url: https://code.qt.io/qt/qtquickcontrols2
  ref: v5.12.0-0-gd3545dbdfdb30e310c6c962ba92f4fdf57354666

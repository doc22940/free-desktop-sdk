kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt5/qtbase.bst

sources:
- kind: git
  url: https://code.qt.io/qt/qtquickcontrols
  ref: v5.12.0-0-g7250a5c2f9dbb61e2c8289f1bf28db2300ce43ad

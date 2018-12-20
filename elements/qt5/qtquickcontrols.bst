kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt/qtbase.bst

sources:
- kind: git
  url: https://code.qt.io/qt/qtquickcontrols
  ref: v5.9.7-0-g1afae24d7f3a67b2727ec6283c44275935de55e1

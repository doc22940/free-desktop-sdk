kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt/qtbase.bst

sources:
- kind: git
  url: https://code.qt.io/qt/qtquickcontrols2
  ref: v5.9.7-0-gf4af8a1987cc3fed8120062fbeb5659c7b2b77df

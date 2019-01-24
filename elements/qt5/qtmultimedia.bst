kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt5/qtbase.bst

sources:
- kind: git
  url: https://code.qt.io/qt/qtmultimedia
  ref: v5.12.0-0-g471d8fd0826c09bbff3b19e477fadad4f5b55ed0

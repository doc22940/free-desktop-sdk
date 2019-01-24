kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt5/qtbase.bst

sources:
- kind: git
  url: https://code.qt.io/qt/qtscript
  ref: v5.12.0-0-g78be34c5125142a16c117f7508fee603c52cbb36

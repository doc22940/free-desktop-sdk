kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt/qtbase.bst

sources:
- kind: git
  url: https://code.qt.io/qt/qtmultimedia
  ref: v5.9.7-0-g2a3c5de691ae25ca37b91cd54bacddb8187ba52f

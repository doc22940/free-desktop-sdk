kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt/qtbase.bst
- filename: base/python2.bst # executes /usr/bin/python
  type: build

sources:
- kind: git
  url: https://code.qt.io/qt/qtdeclarative
  ref: v5.9.7-0-g9e5de38fbb1d46d2fbd3ace3d5267a2e708d144d
  checkout-submodules: False
  submodules:
    tests/auto/qml/ecmascripttests/test262:
      url: https://code.qt.io/qt/qtdeclarative-testsuites.git

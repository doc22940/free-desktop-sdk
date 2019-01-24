kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt5/qtbase.bst
- filename: base/python2.bst # executes /usr/bin/python
  type: build

sources:
- kind: git
  url: https://code.qt.io/qt/qtdeclarative
  ref: v5.12.0-0-g64ee4968b46019b8e4cb7523a6e41833fc4cf665
  checkout-submodules: False
  submodules:
    tests/auto/qml/ecmascripttests/test262:
      url: https://code.qt.io/qt/qtdeclarative-testsuites.git

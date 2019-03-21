kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt5/qtbase.bst
- filename: base/glib.bst
  type: build
- filename: base/icu.bst
  type: build
- filename: base/libpng.bst
  type: build
- filename: base/python3.bst
  type: build
- filename: desktop/freetype.bst
  type: build
- filename: desktop/harfbuzz.bst
  type: build
- filename: desktop/mesa.bst
  type: build

config:
  configure-commands:
    (<):
       - |
         sed "s/python /python3 /g" -i qtdeclarative.pro
         sed "s/ python / python3 /g" -i src/3rdparty/masm/masm.pri
         sed "s/ python/ python3/g" -i src/3rdparty/masm/yarr/generateYarrCanonicalizeUnicode
         sed "s/ python/ python3/g" -i src/3rdparty/masm/yarr/create_regex_tables
         sed "s/ python/ python3/g" -i tests/auto/qml/ecmascripttests/test262.py

  install-commands:
    (>):
      - rm -f "%{install-root}%{libdir}"/*.a

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/*.so"

sources:
- kind: git
  url: https://code.qt.io/qt/qtdeclarative
  ref: v5.12.0-0-g64ee4968b46019b8e4cb7523a6e41833fc4cf665
  checkout-submodules: False
  submodules:
    tests/auto/qml/ecmascripttests/test262:
      url: https://code.qt.io/qt/qtdeclarative-testsuites.git

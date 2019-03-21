kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt5/qtbase.bst
- filename: base/perl.bst
  type: build
- filename: base/glib.bst
  type: build
- filename: base/icu.bst
  type: build
- filename: base/libpng.bst
  type: build
- filename: desktop/freetype.bst
  type: build
- filename: desktop/harfbuzz.bst
  type: build
- filename: desktop/mesa.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/*.so"

sources:
- kind: git_tag
  url: https://code.qt.io/qt/qtscript
  track: 5.12
  ref: v5.12.2-0-g6c0edaf30c5bdfc2739ca646da73dcb697ab1361

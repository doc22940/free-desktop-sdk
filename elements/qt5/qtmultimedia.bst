kind: qmake

depends:
- filename: bootstrap-import.bst
- filename: qt5/qtbase.bst
- filename: desktop/alsa-lib.bst
  type: build
- filename: desktop/gstreamer-plugins-base.bst
  type: build
- filename: desktop/libpulse.bst
  type: build
- filename: desktop/openal.bst
  type: build

config:
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
  url: https://code.qt.io/qt/qtmultimedia
  ref: v5.12.0-0-g471d8fd0826c09bbff3b19e477fadad4f5b55ed0

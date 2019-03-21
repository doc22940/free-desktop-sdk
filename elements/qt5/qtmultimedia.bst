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
- kind: git_tag
  url: https://code.qt.io/qt/qtmultimedia
  track: 5.12
  ref: v5.12.2-0-g9caf4812e073829fc961eb466f1325106f041841

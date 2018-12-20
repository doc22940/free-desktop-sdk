kind: compose

depends:
- filename: qt5/qtbase.bst
  type: build
- filename: qt5/qtdeclarative.bst
  type: build
- filename: qt5/qtquickcontrols.bst
  type: build
- filename: qt5/qtquickcontrols2.bst
  type: build
- filename: qt5/qtmultimedia.bst
  type: build
- filename: qt5/qtscript.bst
  type: build

config:
  exclude:
    - devel
    - debug

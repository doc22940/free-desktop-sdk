kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/wayland-protocols.bst
- filename: desktop/xorg-data-xkeyboard-config.bst
- filename: base/meson.bst
  type: build
- filename: base/ninja.bst
  type: build
- filename: base/bison.bst
  type: build
- filename: base/pkg-config.bst
  type: build

variables:
  meson-local: |
    -Denable-docs=false \
    -Denable-x11=true

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libxkbcommon.so"
        - "%{libdir}/libxkbcommon-x11.so"

sources:
- kind: git
  url: https://github.com/xkbcommon/libxkbcommon.git
  track: master
  ref: 110d17c6bee504569f68a105b2d4d06fe5e7e0b0   #  xkbcommon-0.8.0

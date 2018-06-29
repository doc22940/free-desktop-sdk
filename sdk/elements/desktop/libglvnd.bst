kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xext.bst
- filename: base/automake.bst
  type: build
- filename: base/libtool.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/python3.bst
  type: build

variables:
  conf-local: |
    --enable-asm \
    --enable-tls

config:
  configure-commands:
    (<):
    - |
      ./autogen.sh

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libGLdispatch.so"
        - "%{libdir}/libGLESv1_CM.so"
        - "%{libdir}/libOpenGL.so"
        - "%{libdir}/libEGL.so"
        - "%{libdir}/libGL.so"
        - "%{libdir}/libGLX.so"
        - "%{libdir}/libGLESv2.so"

sources:
- kind: git
  url: https://github.com/NVIDIA/libglvnd.git
  track: master
  ref: 9d909106f232209cf055428cae18387c18918704   #  v1.0.0

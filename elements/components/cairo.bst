kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/pixman.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: components/freetype.bst
- filename: components/fontconfig.bst
- filename: components/gtk-doc.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --enable-xlib \
    --enable-ft \
    --enable-svg \
    --enable-ps \
    --enable-pdf \
    --enable-tee \
    --enable-gobject

config:
  configure-commands:
    (<):
    - |
      %{autogen}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/cairo-sphinx'
        - '%{bindir}/cairo-trace'
        - '%{libdir}/libcairo-script-interpreter.so'
        - '%{libdir}/libcairo-gobject.so'
        - '%{libdir}/libcairo.so'
        - '%{libdir}/cairo/libcairo-trace.so'
  cpe:
    patches:
    - 'CVE-2018-19876'

sources:
- kind: git_tag
  url: freedesktop:cairo/cairo
  track: master
  track-extra:
  - 1.16
  match:
  - 1.*[02468].*
- kind: patch
  path: patches/cairo/cairo-CVE-2018-19876.patch

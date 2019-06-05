kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-util-macros.bst
  type: build
- filename: components/xorg-app-xkbcomp.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --enable-compat-rules \
    --with-xkb-base=/usr/share/X11/xkb \
    --with-xkb-rules-symlink=xorg

sources:
- kind: tar
  url: https://xorg.freedesktop.org/archive/individual/data/xkeyboard-config/xkeyboard-config-2.27.tar.bz2
  ref: 690daec8fea63526c07620c90e6f3f10aae34e94b6db6e30906173480721901f

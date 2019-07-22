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
- kind: git_tag
  url: freedesktop:xkeyboard-config/xkeyboard-config
  track: master
    

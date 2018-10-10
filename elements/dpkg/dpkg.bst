kind: autotools
description: dpkg packaging

variables:
  conf-local: |
    --disable-dselect --disable-shared --enable-static

depends:
  - filename: bootstrap-import.bst
  - filename: base/buildsystem-autotools.bst
    type: build
  - filename: base/gettext.bst
    type: build
  - filename: base/git.bst
    type: build
  - filename: base/patch.bst
    type: build

sources:
  - kind: git
    url: https://git.dpkg.org/git/dpkg/dpkg.git
    track: master
    ref: 6f07b5ebc6a833f4b2d4752e8579acb000cbe62b

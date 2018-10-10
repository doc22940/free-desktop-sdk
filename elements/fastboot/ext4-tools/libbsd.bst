kind: autotools
description: libbsd

depends:
  - filename: bootstrap-import.bst
  - filename: base/git.bst
    type: build
  - filename: base/patch.bst
    type: build
  - filename: base/buildsystem-autotools.bst
    type: build

sources:
  - kind: git
    url: https://gitlab.freedesktop.org/libbsd/libbsd.git
    track: 0.9.1
    ref: 1ca09c18f76a0ed2ef6349463c25d509a55e20ff

kind: make
description: debhelper

depends:
  - filename: base/perl.bst
    type: build

config:
  build-commands: []

sources:
  - kind: git
    url: https://salsa.debian.org/debian/debhelper.git
    track: debian/11.4.1
    ref: a69dfe2854a4ba25008fb4d17db561ad33034b8d

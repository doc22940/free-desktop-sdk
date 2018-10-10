kind: makemaker
description: strip-nondeterminism

depends:
  - filename: base/perl.bst
    type: build

sources:
  - kind: git
    url: https://salsa.debian.org/reproducible-builds/strip-nondeterminism.git
    track: debian/0.043-1
    ref: cd4535ef63301ad8a11cc8f09bf2c8ada0c2d930

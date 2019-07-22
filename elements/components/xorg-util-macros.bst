kind: autotools
description: X.org util macros

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
      - /**

sources:
- kind: tar
  url: https://www.x.org/archive/individual/util/util-macros-1.19.2.tar.bz2


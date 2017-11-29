kind: autotools
description: json2bst conversion of meson
depends:
- base.bst
- autoconf-archive.bst
sources:
- kind: tar
  url: https://pypi.python.org/packages/8f/2d/b82ad8015f68a6a261b458acc07b0252fbb0170d508844bce7fc95793a25/meson-0.43.0.tar.gz
  ref: c1e05a84e7ba34922562b638dbf85ceec817830ec78c776c8d7954b5bf87c562
- kind: patch
  path: meson-no-lib64.patch
config:
  configure-commands:
  - '%{configure} '

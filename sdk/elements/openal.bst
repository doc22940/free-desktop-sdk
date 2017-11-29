kind: cmake
description: json2bst conversion of openal
depends: []
sources:
- kind: tar
  url: http://kcat.strangesoft.net/openal-releases/openal-soft-1.17.2.tar.bz2
  ref: a341f8542f1f0b8c65241a17da13d073f18ec06658e1a1606a8ecc8bbc2b3314
- kind: patch
  path: openal-fpu-neon.patch
config:
  configure-commands:
  - '%{make}  \ -DCMAKE_INSTALL_LIBDIR=lib \ -DCMAKE_BUILD_TYPE=Release'

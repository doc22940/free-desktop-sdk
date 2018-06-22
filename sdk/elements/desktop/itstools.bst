kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/python3.bst
  - filename: base/libxslt.bst

variables:
  conf-local:
    PYTHON="/usr/bin/python3"

sources:
  - kind: git
    url: https://github.com/itstool/itstool
    ref: 890f35998ba7f86bdc58227142309b8ecc618c10
  - kind: patch
    path: patches/itstool-Be-more-careful-about-libxml2-memory-management.patch 

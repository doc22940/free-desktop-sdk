kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/xz.bst
  - filename: base/python3.bst
    type: build

variables:
  conf-local: |
    --with-python=%{bindir}/python3

config:
  install-commands:
    (>):
    - |
      %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libxml2.so"

sources:
  - kind: git
    url: https://gitlab.gnome.org/GNOME/libxml2
    ref: 35e83488505d501864826125cfe6a7950d6cba78
  - kind: patch
    path: patches/libxml2-python-in-nodeWrap-deal-with-name-is-None-case.patch
  - kind: patch
    path: patches/libxml2-python3-unicode-errors.patch

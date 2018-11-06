kind: manual

depends:
- filename: bootstrap-import.bst

config:
  build-commands:
  - |
    make -f supported-locales.mk SUPPORTED

  install-commands:
  - |
    install -D -m0644 SUPPORTED "%{install-root}%{datadir}/i18n/SUPPORTED"

sources:
- kind: git_tag
  url: sourceware:glibc.git
  track: master
  ref: glibc-2.29-0-g330c9d0db1ff29f2f0c2b3561f39539836fbeed5
- kind: local
  path: files/supported-locales.mk

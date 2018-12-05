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
  ref: glibc-2.28-0-g3c03baca37fdcb52c3881e653ca392bba7a99c2b
- kind: local
  path: files/supported-locales.mk

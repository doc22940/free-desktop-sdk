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
  track: release/2.29/master
  ref: glibc-2.29-0-g56c86f5dd516284558e106d04b92875d5b623b7a
- kind: local
  path: files/supported-locales.mk

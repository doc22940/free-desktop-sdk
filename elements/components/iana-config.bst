kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

config:
  build-commands:
  - |
    python3 generate.py

  install-commands:
  - |
    install -D -m644 -t "%{install-root}%{sysconfdir}" protocols services

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/mirrors/iana-config.git
  track: master

- kind: local
  path: files/iana-config

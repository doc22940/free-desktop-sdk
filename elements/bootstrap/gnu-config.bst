kind: manual
description: GNU config scripts

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build

sources:
- kind: git_tag
  url: savannah:config.git
  track: master

config:
  install-commands:
  - |
    install -d "%{install-root}%{datadir}/gnu-config"
  - |
    install -m 0644 config.guess config.sub "%{install-root}%{datadir}/gnu-config"
  - |
    install -m 0644 config.sub "%{install-root}%{datadir}/gnu-config"

public:
  bst:
    split-rules:
      runtime: []
      devel:
        (>):
        - '**'

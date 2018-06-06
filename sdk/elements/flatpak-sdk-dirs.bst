kind: manual
description: |
  Flatpak expects some empty directories to mount extensions.

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  install-commands:
    - |
      mkdir -p "%{install-root}%{indep-libdir}/sdk"
      mkdir -p "%{install-root}%{libdir}/sdk"
      mkdir -p "%{install-root}%{debugdir}"

public:
  bst:
    split-rules:
      devel: []

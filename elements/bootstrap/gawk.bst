kind: autotools
description: GNU awk

depends:
- filename: bootstrap/gawk-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/target.yml

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/gawk"
      ln -s gawk-4.2.1 "%{install-root}%{bindir}/gawk"

sources:
- kind: git_tag
  url: savannah:gawk.git
  ref: gawk-4.2.1-0-gbd8a8ad0c258d2db31e420eec81932cf15bf9702

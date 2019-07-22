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
      ln -s gawk-5.0.1 "%{install-root}%{bindir}/gawk"

    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_tag
  url: savannah:gawk.git
  track: master

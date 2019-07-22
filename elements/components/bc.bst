kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/texinfo.bst
  type: build
- filename: components/ed.bst
  type: build

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:bc/bc-1.07.1.tar.gz

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/help2man.bst
  type: build
- filename: components/texinfo.bst
  type: build
- filename: components/m4.bst
- filename: components/perl.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"


sources:
- kind: tar
  url: ftp_gnu_org:bison/bison-3.3.2.tar.gz

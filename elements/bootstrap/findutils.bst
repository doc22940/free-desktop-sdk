kind: autotools
description: GNU findutils

depends:
- filename: bootstrap/findutils-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/target.yml

config:
  install-commands:
    (>):
      - |
        rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:findutils/findutils-4.6.0.tar.gz
- kind: patch
  path: patches/findutils/findutils-4.6.0-gnulib-fflush.patch
- kind: patch
  path: patches/findutils/findutils-4.6.0-gnulib-makedev.patch

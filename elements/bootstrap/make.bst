kind: autotools
description: GNU make

depends:
- filename: bootstrap/make-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/target.yml

config:
  configure-commands:
    (<):
    - |
      autoreconf -fvi

  install-commands:
    (>):
      - |
        rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:make/make-4.2.1.tar.bz2
- kind: patch
  path: patches/make/make-glob_interface_version_2.patch
- kind: patch
  path: patches/make/make-lstat.patch

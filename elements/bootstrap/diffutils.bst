kind: autotools

depends:
- filename: bootstrap/diffutils-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/target.yml

variables:
  conf-local: |
    gl_cv_func_getopt_gnu=yes

config:
  install-commands:
    (>):
      - |
        rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:diffutils/diffutils-3.7.tar.xz

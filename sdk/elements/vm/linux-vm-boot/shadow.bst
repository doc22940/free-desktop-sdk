kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build

variables:
  conf-local: |
    --without-selinux

sources:
# building from git requires gnome-doc-tools
- kind: tar
  url: https://github.com/shadow-maint/shadow/releases/download/4.5/shadow-4.5.tar.xz
  ref: fc8c858381ad577a5c25ff5beb6ee60a34f8719c73e4e7c61e74188b4e54b741
  etag: '"c350da50c2120de6bb29177699d89fe3"'

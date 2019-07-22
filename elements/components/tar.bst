kind: autotools

depends:
- filename: bootstrap-import.bst

environment:
  FORCE_UNSAFE_CONFIGURE: 1

sources:
- kind: tar
  url: ftp_gnu_org:tar/tar-1.32.tar.xz

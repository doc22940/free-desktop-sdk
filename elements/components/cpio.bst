kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/tar.bst

variables:
  conf-local: |
    --with-rmt="%{libexecdir}/rmt"

config:
  install-commands:
    (>):
    # man8 is empty and this causes issue with compose element.
    - rm -rf "%{install-root}%{mandir}/man8"

sources:
- kind: tar
  url: ftp_gnu_org:cpio/cpio-2.12.tar.bz2

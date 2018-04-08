kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/cracklib.bst
  - filename: base/bison.bst
    type: build
  - filename: base/flex.bst
    type: build
  - filename: base/gettext.bst
    type: build
  - filename: base/gdbm.bst

variables:
  includedir: "%{prefix}/include/security"
  conf-local: |
    --enable-securedir="%{libdir}/security" \
    --disable-prelude

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/security"
          - "%{libdir}/security/**"

sources:
  - kind: tar
    url: http://www.linux-pam.org/library/Linux-PAM-1.3.0.tar.bz2
    ref: 241aed1ef522f66ed672719ecf2205ec513fd0075ed80cda8e086a5b1a01d1bb

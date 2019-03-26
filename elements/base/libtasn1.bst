kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/help2man.bst
  type: build
- filename: base/texinfo.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtasn1.so'

config:
  configure-commands:
    (<):
    - make autoreconf

sources:
- kind: git_tag
  url: https://gitlab.com/gnutls/libtasn1.git
  track: master
  ref: libtasn1_4_13-0-g946565d8eb05fbf7970ea366e817581bb5a90910


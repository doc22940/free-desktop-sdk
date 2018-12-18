kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/flex.bst 
- filename: base/gettext.bst
  type: build
- filename: base/gmp.bst
  type: build
- filename: base/libunistring.bst
  type: build
- filename: base/libffi.bst
  type: build
- filename: base/gc.bst
  type: build
- filename: base/supported-locales.bst
  type: build
- filename: base/libunistring.bst
  type: build


sources:
- kind: git
  url: http://git.sv.gnu.org/r/guile.git
  ref: v2.2.4-0-g791cae940afcb2b2eb2c167fe438be1dc1008a73

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gmp.bst
  type: build
- filename: base/libunistring.bst
  type: build
- filename: base/libffi.bst
  type: build

sources:
- kind: tar
  url: https://ftp.gnu.org/gnu/guile/guile-2.2.4.tar.gz
  ref: 33b904c0bf4e48e156f3fb1d0e6b0392033bd610c6c9d9a0410c6e0ea96a3e5c

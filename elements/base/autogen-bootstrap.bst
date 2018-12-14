kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/glib.bst
  type: build
- filename: base/gperf.bst
  type: build

sources:
- kind: tar
  url: https://ftp.gnu.org/gnu/autogen/rel5.17/autogen-5.17.tar.gz
  ref: ce0d33247cc6856442a11549f39e64cf23514672368ea957e70598e55e7ab518

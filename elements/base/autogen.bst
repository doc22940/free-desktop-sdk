kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/guile.bst
  type: build


sources:
- kind: tar
  url: https://ftp.gnu.org/gnu/autogen/rel5.7/autogen-5.7.tar.gz


  ref: 40fe0573bc61ed791cac8588eed3e71e66c8b26a7f5d3d07e64d71e812214eb2

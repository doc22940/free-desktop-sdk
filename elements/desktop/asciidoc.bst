kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/python2.bst
- filename: base/docbook-xml.bst
- filename: base/docbook-xsl.bst
- filename: base/libxslt.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: https://github.com/asciidoc/asciidoc
  track: master
  ref: 8.6.10-0-g37f6baaf04e2d6123a1f7318a5ec361d2ed6ca28

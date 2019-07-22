kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/itstools.bst
- filename: components/docbook-xml.bst
- filename: components/docbook-xsl.bst
- filename: components/pkg-config.bst   # gtk-doc uses pkg-config during runtime.
- filename: components/python3.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: gnome:gtk-doc
  track: master

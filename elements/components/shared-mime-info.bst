kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libxml2.bst
- filename: components/glib.bst

variables:
  notparallel: true

sources:
- kind: tar
  url: freedesktop:xdg/shared-mime-info/uploads/80c7f1afbcad2769f38aeb9ba6317a51/shared-mime-info-1.12.tar.xz
  ref: 18b2f0fe07ed0d6f81951a5fd5ece44de9c8aeb4dc5bb20d4f595f6cc6bd403e
- kind: patch
  path: patches/shared-mime-info/Install_ITS_file_to_make_gettext_extract_translations_from_MIME_configuration.patch

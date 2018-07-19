kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/glib.bst
  - filename: desktop/libcanberra.bst

sources:
  - kind: tar
    url: https://download.gnome.org/sources/gsound/1.0/gsound-1.0.2.tar.xz
    ref: bba8ff30eea815037e53bee727bbd5f0b6a2e74d452a7711b819a7c444e78e53

kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/autoconf.bst
    type: build
  - filename: base/autoconf-archive.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: desktop/gtk-doc.bst
  - filename: base/glib.bst
  - filename: desktop/libcanberra.bst

# This makes the build succeed
#environment:
#  CFLAGS: "-Wno-cast-function-type"

sources:
  - kind: git
    url: https://gitlab.gnome.org/GNOME/gsound.git
    track: master
    ref: a86946b494aa32782b3f6334344d07b5c11d5219

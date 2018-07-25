kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/libproxy.bst
  - filename: base/glib.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/gnutls.bst

variables:
  conf-local: |
    --with-libproxy \
    --with-ca-certificates=%{ca_path}

sources:
  - kind: tar
    url: https://download.gnome.org/sources/glib-networking/2.56/glib-networking-2.56.1.tar.xz
    ref: df47b0e0a037d2dcf6b1846cbdf68dd4b3cc055e026bb40c4a55f19f29f635c8

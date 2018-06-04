kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/itstools.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/docbook-xml.bst
  - filename: base/docbook-xsl.bst
  - filename: base/gettext.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/python3.bst
  - filename: base/which.bst
    type: build

config:
  install-commands:
    (>):
    - |
      %{delete_libtool_files}

sources:
  - kind: git
    url: https://gitlab.gnome.org/GNOME/gtk-doc.git
    ref: 69661dfd5b32a395ca6395673d4eebc0422f5cd4

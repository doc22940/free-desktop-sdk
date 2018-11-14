kind: meson

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/glib.bst

sources:
- kind: git_tag
  url: github:flatpak/flatpak-xdg-utils.git
  track: master
  ref: 0.1-0-g7805ba43b2c58231ce5779d1dcfc0fcb1156d170

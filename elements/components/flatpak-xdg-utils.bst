kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/glib.bst

sources:
- kind: git_tag
  url: github:flatpak/flatpak-xdg-utils.git
  track: master

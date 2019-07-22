kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/wayland.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:wayland/wayland-protocols.git
  track: master

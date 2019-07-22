kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: public-stacks/buildsystem-autotools.bst
    type: build
  - filename: components/python3.bst
    type: build

sources:
- kind: git_tag
  url: freedesktop:libevdev/libevdev.git
  track: master

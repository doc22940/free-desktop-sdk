kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/glib.bst

public:
  bst:
    integration-commands:
    - |
      update-desktop-database

sources:
- kind: git_tag
  url: freedesktop:xdg/desktop-file-utils.git
  track: master

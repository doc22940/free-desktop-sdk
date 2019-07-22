kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: github:dosfstools/dosfstools.git
  track: master

config:
  install-commands:
    (>):
    - ln -s %{prefix}/bin/mkfs.fat %{install-root}/%{prefix}/bin/mkdosfs

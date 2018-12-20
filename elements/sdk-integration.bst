kind: collect_integration
description: Combines integration commands of all components of the SDK into a single
  shell script

config:
  script-path: '%{libexecdir}/freedesktop-post.sh'
  ignore:
  - desktop/dbus.bst

depends:
- filename: desktop.bst
  type: build

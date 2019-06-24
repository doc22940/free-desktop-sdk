kind: pip

depends:
- filename: public-stacks/buildsystem-autotools.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build
- filename: components/pkg-config.bst
  type: build
- filename: components/dbus.bst
- filename: components/pygobject.bst

sources:
- kind: git_tag
  url: https://gitlab.freedesktop.org/dbus/dbus-python
  track: master
  ref: dbus-python-1.2.8-0-gb7f3f7757c28fdc25ce413ccb3c2c6f7e16cbb51

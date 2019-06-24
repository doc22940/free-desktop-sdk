kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst
- filename: components/dbus-python.bst
- filename: components/pygobject.bst
- filename: components/pyelftools.bst

sources:
- kind: local
  path: files/get-debug-files

kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst

variables:
  pip: pip3
  fix-pyc-timestamps: "true"

sources:
- kind: git_tag
  url: github:benjaminp/six.git
  track: master

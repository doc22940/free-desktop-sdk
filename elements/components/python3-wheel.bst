kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: git_tag
  url: github:pypa/wheel.git
  track: master
  ref: 0.33.6-0-gb227ddd5beaba49294017d061d501f6d433393b0

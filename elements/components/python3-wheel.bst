kind: pip

depends:
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: git_tag
  url: https://github.com/pypa/wheel.git
  track: master
  ref: 0.33.4-0-g882cd05d9bf4c4fc72568d806e227b5cf14df1d7

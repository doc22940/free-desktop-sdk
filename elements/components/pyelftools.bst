kind: pip

depends:
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: git_tag
  url: https://github.com/eliben/pyelftools.git
  track: master
  ref: v0.25-0-g572d5e80db9e00ec1fd9001adba3ff573438e5c9

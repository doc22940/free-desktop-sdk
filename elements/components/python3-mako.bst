kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst

variables:
  pip: pip3
  fix-pyc-timestamps: "true"

public:
  cpe:
    version: '1.0.13'

sources:
- kind: git_tag
  url: github:sqlalchemy/mako.git
  track: master

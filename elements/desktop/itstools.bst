kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
- filename: base/libxslt.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: PYTHON="/usr/bin/python3"

sources:
- kind: git_tag
  url: github:itstool/itstool.git
  track: master
  ref: 2.0.6-0-g60f3a955ca047b1d62a1d952beec74afaff7cbbf

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
  type: build

sources:
- kind: git_tag
  url: https://salsa.debian.org/iso-codes-team/iso-codes.git
  track: master
  ref: iso-codes-4.2-0-g58a4f20f8e6f4d8f9545333f3eae4cfe5678de16

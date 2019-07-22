kind: autotools

depends:
- filename: bootstrap/acl-build-deps.bst
  type: build
- filename: bootstrap/attr.bst
  type: runtime

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libattr.so'
        - '%{libdir}/libacl.so'
        - '%{libexecdir}/libacl.so'

(@): elements/bootstrap/target.yml

config:
  configure-commands:
    (<):
      - ./autogen.sh

sources:
- kind: git_tag
  url: savannah:acl.git
  track: master

kind: autotools

depends:
- filename: bootstrap/attr-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libattr.so'

(@): elements/bootstrap/target.yml

config:
  configure-commands:
    (<):
      - ./autogen.sh

  install-commands:
    (>):
# Man pages will be provided by Linux's man-pages
# sdk/elements/base/man-pages.bst
    - |
      rm -rf "%{install-root}%{mandir}"

sources:
- kind: git_tag
  url: savannah:attr.git
  ref: v2.4.48-0-gcfd8e6ef491a7a5ff900ba2ba3deff7d0bebb0a6

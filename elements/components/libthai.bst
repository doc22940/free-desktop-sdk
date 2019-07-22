kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libdatrie.bst
- filename: components/git-minimal.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libthai.so'

sources:
- kind: git_tag
  url: github:tlwg/libthai.git
  track: master

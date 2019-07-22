kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  includedir: "%{prefix}/include/%{gcc_triplet}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{prefix}/include'
        - '%{libdir}/libnpth.so'

sources:
- kind: git_tag
  url: gnupg:npth.git
  track: master

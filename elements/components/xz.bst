kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build


public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblzma.so'

sources:
- kind: git_tag
  url: https://git.tukaani.org/xz.git
  track: master
  track-extra:
  - v5.2
  exclude:
  - v*alpha
  - v*beta

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/git-minimal.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libopus.so'

sources:
- kind: git_tag
  url: https://git.xiph.org/opus.git
  track: master
  ref: v1.3.1-0-ge85ed7726db5d677c9c0677298ea0cb9c65bdd23

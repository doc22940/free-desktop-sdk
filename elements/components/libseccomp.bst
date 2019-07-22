kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --disable-rpath

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libseccomp.so'
  cpe:
    version: '2.4.1'

sources:
- kind: git_tag
  url: github:seccomp/libseccomp/
  track: release-2.4
- kind: patch
  path: patches/libseccomp/no-static.patch

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  autogen: |
    ./makeconf.sh

environment:
  MOUNT_FUSE_PATH: '%{sbindir}'

sources:
- kind: git_tag
  url: github:libfuse/libfuse
  track: fuse_2_9_bugfix
- kind: patch
  path: patches/fuse/fuse-kernel-h-clean-includes.patch

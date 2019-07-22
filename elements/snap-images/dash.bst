# This is temporary. We need to report to snap missing apparmor rule
# to read libhistory.so required by bash. Until then, we have a simple
# shell for /bin/sh.
kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: https://git.kernel.org/pub/scm/utils/dash/dash.git
  track: master

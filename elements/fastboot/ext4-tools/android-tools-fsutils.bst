kind: dpkg_build
description: Installation of tools to create Android sparse ext4 images.

depends:
  - filename: bootstrap-import.bst
  - filename: dpkg/dpkg-tools.bst
    type: build
  - filename: fastboot/ext4-tools/libbsd.bst
    type: build

config:
  build-commands:
    (<):
    - dpkg-source --before-build .

environment:
  DEB_HOST_GNU_TYPE: "%{triplet}"

sources:
- kind: git
  track: 5.1.1.r38-1.1
  ref: 10847c822023624bc45cedea2ebb6bb703edfc75
  url: https://salsa.debian.org/android-tools-team/android-tools.git
- kind: patch
  path: patches/android-tools-fsutils-remove-python-addon.patch
- kind: patch
  path: patches/android-tools-fsutils-fix-big-endian-build.patch


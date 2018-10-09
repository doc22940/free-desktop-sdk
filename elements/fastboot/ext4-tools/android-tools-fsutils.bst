kind: dpkg_build
description: Installation of tools to create Android sparse ext4 images.

depends:
  - filename: bootstrap-import.bst
  - filename: dpkg/dpkg.bst
    type: build

sources:
- kind: git
  ref: 5d960b6ef1848db13d079223cecb719967ccbc3b
  url: https://salsa.debian.org/android-tools-team/android-tools.git

kind: manual
description: Installation of tools to create Android sparse ext4 images.

depends:
  - filename: bootstrap-import.bst

variables:
  bins: "%{install-root}/usr/bin"

config:
  install-commands:
    - |
      install -d -m 0755 "%{bins}"
      install ./bin/* "%{bins}"

sources:
  - kind: deb
    url:  http://ftp.uk.debian.org/debian/pool/main/a/android-tools/android-tools-fsutils_4.2.2+git20130529-5.1_arm64.deb
    ref: f79392056922d09d93bac5a03ab068e1777947c95bcdc73a54ea5db74d940e4d
    base-dir: 'usr'


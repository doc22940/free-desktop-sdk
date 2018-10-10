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
    - |
      dpkg-source --before-build .
      dh clean
      dh build

  install-commands:
    - |
      dh install
      %{install-packages}
      dh_gencontrol

variables:
  (?):
  - target_arch == "aarch64":
      deb_host_arch: "arm64"
  - target_arch == "arm":
      deb_host_arch: "armhf"
  - target_arch == "i586" or target_arch == "x86_64":
      deb_host_arch: "amd64"
  packages: android-tools-fsutils android-tools-adbd android-tools-mkbootimg

environment:
  DEB_HOST_GNU_TYPE: "%{triplet}"
  DEB_HOST_ARCH: "%{deb_host_arch}"

sources:
- kind: git
  track: 5.1.1.r38-1.1
  ref: 10847c822023624bc45cedea2ebb6bb703edfc75
  url: https://salsa.debian.org/android-tools-team/android-tools.git
- kind: patch
  path: patches/android-tools-fsutils-remove-python-addon.patch
- kind: patch
  path: patches/android-tools-fsutils-fix-big-endian-build.patch
- kind: patch
  path: patches/android-tools-fsutils-remove-deprecated-packages.patch


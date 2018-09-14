kind: autotools
description: GNU awk

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: binutils-stage1.bst
  type: build
- filename: glibc.bst
  type: build
- filename: cross-installation-links.bst
  type: build
- filename: debugedit-host.bst
  type: build

variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{triplet}"

config:
  install-commands:
    - |
      cd "%{builddir}"
      %{cross-install}
    - |
      %{delete_libtool_files}

sources:
- kind: git
  url: https://git.savannah.gnu.org/git/gawk.git
  track: gawk-4.2.1
  ref: bd8a8ad0c258d2db31e420eec81932cf15bf9702

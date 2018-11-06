kind: autotools
description: GNU findutils

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
  build-triplet: '%{guessed-triplet}'
  host-triplet: '%{triplet}'

config:
  install-commands:
  - |
    cd "%{builddir}"
    %{cross-install}
  - |
    %{delete_libtool_files}

sources:
- kind: git_tag
  url: git_savannah_gnu_org:findutils.git
  ref: v4.6.0-0-g992a6b62ab8061531dc0ad40325b8e4c222fce66

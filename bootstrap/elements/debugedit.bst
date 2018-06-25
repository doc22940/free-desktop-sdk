kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: binutils-stage1.bst
  type: build
- filename: cross-installation-links.bst
  type: build
- filename: glibc.bst
  type: build

config:
  install-commands:
    - |
      cd "%{builddir}"
      %{cross-install}

    - |
      %{delete_libtool_files}


sources:
- kind: git
  url: https://github.com/rpm-software-management/rpm
  ref: 697b680222cb9b1d23fdf2ace0b06263b32aab82

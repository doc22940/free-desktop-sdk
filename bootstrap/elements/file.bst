kind: autotools

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
- filename: file-stage1.bst
  type: build
- filename: zlib.bst
- filename: debugedit-host.bst
  type: build

variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{triplet}"

config:
  configure-commands:
    (<):
      - autoreconf -ivf

  install-commands:
    - |
      cd "%{builddir}"
      %{cross-install}
    - |
      %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{sysroot}%{libdir}/libmagic.so"

sources:
  - kind: git
    url: https://github.com/file/file.git
    track: FILE5_34
    ref: 315cef2f699da3c31a54bd3c6c6070680fbaf1f5

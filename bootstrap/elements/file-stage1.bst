kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: tools-lib-path.bst
  type: runtime

variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{guessed-triplet}"
  prefix: "%{tools}"
  lib: "lib"

config:
  configure-commands:
    (<):
      - autoreconf -ivf

sources:
  - kind: git
    url: https://github.com/file/file.git
    track: FILE5_34
    ref: 315cef2f699da3c31a54bd3c6c6070680fbaf1f5

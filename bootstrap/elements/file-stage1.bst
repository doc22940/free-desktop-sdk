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
    track: FILE5_33
    ref: 219846094c7593e27453e62855e61181089c48cf

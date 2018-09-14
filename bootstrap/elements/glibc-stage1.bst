kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build

variables:
  prefix: "/glibc"
  lib: "lib"
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{guessed-triplet}"

environment:
  CPPFLAGS: ""
  CFLAGS: "-O2 -g"
  CXXFLAGS: "-O2 -g"
  LDFLAGS: ""

sources:
- kind: git
  url: http://sourceware.org/git/glibc.git
  track: glibc-2.27
  ref: 23158b08a0908f381459f273a984c6fd328363cb
- kind: patch
  path: patches/glibc-reorder-end.patch

kind: autotools
description: GNU readline

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: debugedit-host.bst
  type: build

sysroots:
- path: /sysroot
  depends:
  - filename: glibc.bst
  - filename: file.bst
  - filename: ncurses.bst

variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{triplet}"

  conf-local: |
    --with-curses \
    CPPFLAGS="${CPPFLAGS} -I/sysroot%{includedir}"

config:
  build-commands:
    - |
      cd "%{builddir}"
      %{make} SHLIB_LIBS=-lncurses

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libreadline.so"
          - "%{libdir}/libhistory.so"

sources:
- kind: tar
  url: ftp_gnu_org:readline/readline-7.0.tar.gz
  ref: 750d437185286f40a369e1e4f4764eda932b9459b5ec9a731628393dd3d32334
- kind: patch
  path: patches/readline-disable-rpath.patch

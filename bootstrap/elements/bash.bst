kind: autotools
description: GNU Bash

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
  - filename: ncurses.bst
  - filename: readline.bst

variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{triplet}"
  # bash_cv_termcap_lib is for working around undetected of libtinfo
  # because termcap is detected
  conf-local: |
    --with-curses \
    --with-installed-readline="/sysroot%{prefix}" \
    --enable-job-control \
    --without-bash-malloc \
    ac_cv_rl_version=7.0 \
    bash_cv_getcwd_malloc=yes \
    bash_cv_job_control_missing=present \
    bash_cv_termcap_lib=libtinfo

config:
  install-commands:
    (>):

    - |
      ln -s bash "%{install-root}%{bindir}/sh"

sources:
  - kind: git
    url: https://git.savannah.gnu.org/git/bash.git
    track: master
    ref: b0776d8c49ab4310fa056ce1033985996c5b9807 # Bash-4.4 patch 19

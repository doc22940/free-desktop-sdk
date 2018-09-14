kind: autotools
description: GNU Bash

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
- filename: ncurses.bst
  type: build
- filename: readline.bst
  type: build
- filename: cross-installation-links.bst
  type: build
- filename: debugedit-host.bst
  type: build

variables:
  build-triplet: "%{guessed-triplet}"
  host-triplet: "%{triplet}"
  # bash_cv_termcap_lib is for working around undetected of libtinfo
  # because termcap is detected
  conf-local: |
    --with-curses \
    --with-installed-readline="/readline-separate-install%{prefix}" \
    --enable-job-control \
    --without-bash-malloc \
    ac_cv_rl_version=7.0 \
    bash_cv_getcwd_malloc=yes \
    bash_cv_job_control_missing=present \
    bash_cv_termcap_lib=libtinfo

config:
  install-commands:
    - |
      cd "%{builddir}"
      %{cross-install}

    - |
      ln -s bash "%{install-root}%{sysroot}%{bindir}/sh"

    - |
      %{delete_libtool_files}

sources:
  - kind: git
    # No track field as this repository doesn't tag patches to release tag
    # Bash-4.4 patch 18
    url: https://git.savannah.gnu.org/git/bash.git
    ref: eb78197af36bb0fb95493ebf8fce104be6832ec9

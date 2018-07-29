kind: autotools

depends:
  - filename: bootstrap-import.bst

variables:
  conf-local: |
    --without-selinux

config:
  install-commands:
    (>):
      # Remove utilities provided by util-linux
      - |
        rm -r "%{install-root}%{bindir}/login"
        rm -r "%{install-root}%{bindir}/su"
        rm -r "%{install-root}%{bindir}/chsh"
        rm -r "%{install-root}%{bindir}/chfn"
        rm -r "%{install-root}%{bindir}/sg"
        rm -r "%{install-root}%{bindir}/nologin"
        rm -r "%{install-root}%{bindir}/groups"
      # ...and their many man pages
      - find "%{install-root}%{datadir}"/man -name 'chsh.1' -delete
      - find "%{install-root}%{datadir}"/man -name 'su.1' -delete
      - find "%{install-root}%{datadir}"/man -name 'logoutd.8' -delete
      - find "%{install-root}%{datadir}"/man -name 'login.1' -delete
      - find "%{install-root}%{datadir}"/man -name 'nologin.8' -delete
      - find "%{install-root}%{datadir}"/man -name 'vipw.8' -delete
      - find "%{install-root}%{datadir}"/man -name 'newgrp.1' -delete
      - find "%{install-root}%{datadir}"/man -name 'groups.1' -delete

sources:
  - kind: tar
    url: https://github.com/shadow-maint/shadow/releases/download/4.6/shadow-4.6.tar.xz
    ref: 0998c8d84242a231ab0acb7f8613927ff5bcff095f8aa6b79478893a03f05583

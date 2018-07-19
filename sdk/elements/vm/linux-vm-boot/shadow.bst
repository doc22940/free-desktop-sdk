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
  # building from git requires gnome-doc-tools
  - kind: tar
    url: https://github.com/shadow-maint/shadow/releases/download/4.5/shadow-4.5.tar.xz
    ref: fc8c858381ad577a5c25ff5beb6ee60a34f8719c73e4e7c61e74188b4e54b741

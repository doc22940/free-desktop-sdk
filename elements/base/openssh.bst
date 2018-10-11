kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/openssl-1.0.bst
    type: build
  - filename: base/openssl-1.0-runtime-only.bst
    type: runtime

variables:
  conf-local: |
    --with-mantype=man

config:
  (?):
  - sshd != True:
      install-commands:
        (>):
          - rm %{install-root}%{bindir}/sshd
          - rm %{install-root}%{sysconfdir}/sshd_config
          - rm %{install-root}%{libexecdir}/sftp-server
          - rm %{install-root}%{mandir}/man5/sshd_config.5
          - rm %{install-root}%{mandir}/man8/sftp-server.8
          - rm %{install-root}%{mandir}/man8/sshd.8

sources:
  - kind: git
    url: https://github.com/openssh/openssh-portable
    ref: 71508e06fab14bc415a79a08f5535ad7bffa93d9  # V_7_8_P1

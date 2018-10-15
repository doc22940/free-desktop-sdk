kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/buildsystem-autotools.bst
    type: build
  - filename: base/openssl-1.0.bst
    type: build
  - filename: base/openssl-1.0-runtime-only.bst
    type: runtime

variables:
  conf-local: |
    --with-mantype=man

public:
  bst:
    split-rules:
      extra:
        - "%{bindir}/sshd"
        - "%{sysconfdir}/sshd_config"
        - "%{libexecdir}/sftp-server"
        - "%{mandir}/man5/sshd_config.5"
        - "%{mandir}/man8/sftp-server.8"
        - "%{mandir}/man8/sshd.8"

sources:
  - kind: git
    url: https://github.com/openssh/openssh-portable
    ref: 71508e06fab14bc415a79a08f5535ad7bffa93d9  # V_7_8_P1

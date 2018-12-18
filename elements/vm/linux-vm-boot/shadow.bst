kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    --without-selinux

config:
  install-commands:
    (>):
    - |
      mv %{install-root}%{prefix}/sbin/* %{install-root}%{bindir}/
    - |
      rm -r %{install-root}%{prefix}/sbin

public:
  bst:
    overlap-whitelist:
    - '**'
    integration-commands:
    - touch /etc/shadow
    - chmod 0600 /etc/shadow
    - groupadd -g 1000 users

sources:
- kind: tar
  url: github:shadow-maint/shadow/releases/download/4.6/shadow-4.6.tar.xz
  ref: 0998c8d84242a231ab0acb7f8613927ff5bcff095f8aa6b79478893a03f05583

kind: stack
depends:
  - filename: bootstrap-dev-extract.bst
  - filename: bootstrap-platform-extract.bst

public:
  bst:
    integration-commands:
      - |
        [ -f /etc/ld.so.conf ] || touch /etc/ld.so.conf

      - |
        ldconfig

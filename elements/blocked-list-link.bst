kind: manual

depends:
  - filename: bootstrap-import.bst

config:
  install-commands:
    - |
      mkdir -p "%{install-root}%{sysconfdir}"
      ln -s /app/etc/freedesktop-sdk.ld.so.blockedlist "%{install-root}%{sysconfdir}/freedesktop-sdk.ld.so.blockedlist"

kind: manual

depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    install -m 0755 -d "%{install-root}/usr/share/fonts/eosrei-emojione"
    install -p -m 644 emojione-android.ttf "%{install-root}/usr/share/fonts/eosrei-emojione"

sources:
  # Last free version, do not update!
- kind: remote
  url: github:emojione/emojione/raw/693a9705f60efd566e40a5c9ec00ca306c9bcbd0/extras/fonts/emojione-android.ttf

kind: import
description: Import the base freedesktop platform
config:
  source: files
public:
  bst:
    integration-commands:
    - ldconfig

(?):
  - target_arch == "x86_64":
      sources:
      - kind: ostree
        url: https://sdk.gnome.org/repo/
        track: runtime/org.freedesktop.BasePlatform/x86_64/1.6
        ref: 4795c33d76a24ed017c1a1b8b94ef2177df000f0f1afd22d32796ce4577b4a32
        gpg-key: keys/gnome-sdk.gpg

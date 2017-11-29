kind: import
description: Import the base freedesktop SDK
config:
  source: files
  target: usr

(?):
  - target_arch == "x86_64":
      sources:
      - kind: ostree
        url: https://sdk.gnome.org/repo/
        track: runtime/org.freedesktop.BaseSdk/x86_64/1.6
        ref: ea891814664d1f16f44160c261440ebd31f8c1fa42b2f6695f5bf5c999c32496
        gpg-key: keys/gnome-sdk.gpg

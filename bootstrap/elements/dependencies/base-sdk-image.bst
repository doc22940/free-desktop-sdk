kind: import
description: Import the base freedesktop SDK
sources:
- kind: ostree
  url: https://cache.sdk.freedesktop.org/releases/
  (?):
  - build_arch == "x86_64":
      track: runtime/org.freedesktop.BaseSdk/x86_64/unstable
      ref: df394194c9c1423d4b8f7e8a096ed232ab3628a534d03a9428e4700efc0bc0ae
  - build_arch == "i386":
      track: runtime/org.freedesktop.BaseSdk/i386/unstable
      ref: 74a8dc4292b524b76ad2e2f1485ff6e534bf7aa2a81d8d57a9c12d5a171a5777
  - build_arch == "aarch64":
      track: runtime/org.freedesktop.BaseSdk/aarch64/unstable
      ref: 889b5b177e2d10d88fb34935711fbd977d180fe8c4e05c6f6730a76246a59807

config:
  source: files
  target: usr

kind: meson

depends:
- filename: base.bst

sources:
- kind: git
  url: https://github.com/systemd/systemd.git
  ref: 46659f7deb962f55c728e70597e37c2a3ab6326d

variables:
  meson-local: |
       -Dsystem-uid-max=999 \
       -Dsystem-gid-max=999

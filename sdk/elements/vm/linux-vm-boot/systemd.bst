kind: meson

depends:
- filename: base.bst

sources:
- kind: git
  url: git@github.com:systemd/systemd.git
  ref: 46659f7deb962f55c728e70597e37c2a3ab6326d

variables:
  meson-local: |
       -Dsystemd_sys_uid_max=999

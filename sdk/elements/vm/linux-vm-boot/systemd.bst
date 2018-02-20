kind: autotools

depends:
- filename: base.bst

config:
 configure-commands: []

 install-commands: []

sources:
- kind:git
  url: freedekstop:systemd
  ref: HEAD


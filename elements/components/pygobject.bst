kind: pip

depends:
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build
- filename: components/gobject-introspection.bst
- filename: components/pkg-config.bst
  type: build
- filename: components/python3-wheel.bst
- filename: components/pycairo.bst
  type: build # Is it build dep only?

sources:
- kind: git_tag
  url: https://gitlab.gnome.org/GNOME/pygobject.git
  track: pygobject-3-32
  ref: 3.32.1-0-gff4dd4ec890528eecd8662f308b9b1b0585ab0fc

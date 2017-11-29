kind: meson
description: json2bst conversion of libappstream-glib
depends:
- base.bst
sources:
- kind: tar
  url: https://people.freedesktop.org/~hughsient/appstream-glib/releases/appstream-glib-0.7.2.tar.xz
  ref: c3b95171db6f61e9273c0e1e9341f19e487e20d49c466f56cd87f18c1859b77f
config:
  configure-commands:
  - '%{meson}  \ -Denable-fonts=false \ -Denable-dep11=false \ -Denable-rpm=false
    \ -Denable-stemmer=false'

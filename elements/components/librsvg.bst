kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: extensions/rust/rust.bst
  type: build
- filename: components/vala.bst
  type: build
- filename: components/gdk-pixbuf.bst
- filename: components/pango.bst
- filename: components/cairo.bst
- filename: components/libcroco.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gtk-doc.bst
  type: build
- filename: components/gobject-introspection.bst
  type: build

variables:
  conf-local: |
    --enable-gtk-doc \
    --enable-vala

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/librsvg-2.so'

environment:
  PATH: /usr/bin:/usr/lib/sdk/rust/bin

config:
  configure-commands:
    (<):
    - |
      mkdir .cargo
      cp cargo-vendor-config .cargo/config

(@):
- elements/components/librsvg.crates.yml

sources:
  (<):
  - kind: git_tag
    url: gnome:librsvg
    track: master
    track-extra:
    - librsvg-2.44
    exclude:
    - '*.*[13579].*'
    ref: 2.44.14-0-gd1a5e5caf52b37031b70b297a9a9cfa24bd9a359

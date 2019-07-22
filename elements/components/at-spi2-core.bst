kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/dbus.bst
- filename: components/gtk-doc.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/glib.bst

variables:
  conf-local: |
    --disable-x11

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatspi.so'

  cpe:
    version: '2.33.2'
    vendor: 'gnome'

sources:
- kind: git_tag
  url: gnome:at-spi2-core
  track: master

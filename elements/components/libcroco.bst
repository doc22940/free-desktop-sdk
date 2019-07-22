kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gtk-doc.bst
  type: build
- filename: components/glib.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcroco-0.6.so'

sources:
- kind: git_tag
  url: gnome:libcroco
  track: master

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xkbfile.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: tar
  url: https://www.x.org/archive/individual/app/xkbcomp-1.4.2.tar.bz2

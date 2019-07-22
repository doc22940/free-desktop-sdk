kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/texinfo.bst
  type: build
- filename: components/help2man.bst
  type: build
- filename: components/m4.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/tar.bst
  type: build
- filename: components/gzip.bst
  type: build

config:
  configure-commands:
    (<):
    - |
      ./autogen.sh

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/*'
        - '%{libdir}/libfl.so'

sources:
- kind: tar
  url: github:westes/flex/files/981163/flex-2.6.4.tar.gz
- kind: patch
  path: patches/flex/flex-pie.patch

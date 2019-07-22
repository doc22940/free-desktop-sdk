kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexpat.so'

  cpe:
    version: 2.2.7

config:
  configure-commands:
  - |
    cd expat
    %{autogen}

  - |
    mkdir %{builddir}
    cd %{builddir}
    ../expat/%{configure}

sources:
- kind: git_tag
  url: github:libexpat/libexpat.git
  track: master

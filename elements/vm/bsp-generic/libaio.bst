kind: make

depends:
- filename:  bootstrap-import.bst

variables:
  install-commands: make -j1 prefix="%{install-root}" includedir="%{install-root}/%{includedir}" libdir="%{install-root}%{libdir}" install

config:
  install-commands:
  - |
    %{install-commands}

sources:
- kind: tar
  url: https://releases.pagure.org/libaio/libaio-0.3.111.tar.gz

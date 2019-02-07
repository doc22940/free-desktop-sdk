kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  make-args: |
    INSTALLROOT='%{install-root}' \
    LIBDIR='%{libdir}' \
    PREFIX='%{prefix}'

config:
  build-commands:
  - |
    make %{make-args}

  install-commands:
  - |
    make -j1 %{make-args} install

sources:
- kind: tar
  url: https://downloads.sourceforge.net/gnu-efi/gnu-efi-3.0.9.tar.bz2
  ref: 6715ea7eae1c7e4fc5041034bd3f107ec2911962ed284a081e491646b12277f0

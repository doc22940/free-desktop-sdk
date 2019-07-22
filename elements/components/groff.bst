kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
- filename: components/texinfo.bst
  type: build

config:
  build-commands:
    (<):
      # This is a workaround for a bug with parallel builds.
    - |
      cd "%{builddir}"
      make -j1 arch/misc

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:groff/groff-1.22.3.tar.gz
- kind: patch
  path: patches/groff/groff-reproducible-build.patch
- kind: patch
  path: patches/groff/groff-reproducible-build-2.patch

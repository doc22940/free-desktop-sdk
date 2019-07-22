kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
- filename: components/expat.bst

config:
  configure-commands:
  - |
    perl Makefile.PL PREFIX="%{prefix}" DESTDIR="%{install-root}"

  install-commands:
  - |
    make -j1 install

  - |
    find "%{install-root}" -type f -name perllocal.pod -delete

sources:
- kind: tar
  url: https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.44.tar.gz


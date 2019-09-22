kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  config: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    BINDIR="%{bindir}"
    INCDIR="%{includedir}"
    MANDIR="%{mandir}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgif.so'

config:
  build-commands:
  - |
    make %{config}

  install-commands:
  - |
    make install %{config} DESTDIR="%{install-root}"

  - |
    rm "%{install-root}%{libdir}/libgif.a"

sources:
- kind: tar
  url: sourceforge_download:giflib/giflib-5.1.9.tar.bz2
  ref: 292b10b86a87cb05f9dcbe1b6c7b99f3187a106132dd14f1ba79c90f561c3295

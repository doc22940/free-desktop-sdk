kind: manual

depends:
- filename: bootstrap-import.bst

config:
  build-commands:
  - |
    make bz2

  install-commands:
  - |
    make DESTDIR="%{install-root}" install

sources:
- kind: tar
  url: https://www.kernel.org/pub/linux/docs/man-pages/man-pages-posix/man-pages-posix-2013-a.tar.xz

kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/man-pages-posix.bst

config:
  install-commands:
  - |
    make DESTDIR="%{install-root}" install

sources:
- kind: git_tag
  url: https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
  track: master

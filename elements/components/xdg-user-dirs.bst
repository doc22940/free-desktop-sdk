kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-link-args: ''
  conf-local: |
    --disable-documentation

config:
  build-commands:
  - |
    cd "%{builddir}"
    %{make} SUBDIRS=po

  install-commands:
  - |
    cd "%{builddir}"
    %{make-install} SUBDIRS=po

sources:
- kind: git_tag
  url: freedesktop:xdg/xdg-user-dirs.git
  track: master

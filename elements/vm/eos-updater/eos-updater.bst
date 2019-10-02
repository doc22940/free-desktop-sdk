kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gtk-doc.bst
  type: build
- filename: components/valgrind.bst
  type: build
- filename: deploy-tools/ostree.bst
- filename: deploy-tools/flatpak.bst
- filename: components/gobject-introspection.bst
- filename: components/gnupg.bst

- filename: vm/eos-updater/networkmanager.bst
- filename: vm/eos-updater/eos-metrics.bst
- filename: vm/eos-updater/avahi.bst
- filename: vm/eos-updater/mogwai.bst

variables:
  conf-local: >-
    --disable-Werror

sources:
- kind: git_tag
  url: github:endlessm/eos-updater.git
  track: master
  track-extra:
  - eos3.6
  - eos3.7
  ref: Release_3.6.4-0-gda9ff540673df5ef9230d50a668dc28bd7b92979
- kind: patch
  path: patches/eos-updater/fix-newer-autoconf.patch
- kind: patch
  path: patches/eos-updater/remove-ostree-fork-only-calls.patch

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/gpgme.bst
- filename: components/glib.bst
- filename: components/bison.bst
- filename: components/e2fsprogs.bst
- filename: components/libsoup.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: deploy-tools/fuse.bst
- filename: components/systemd-libs.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libostree.so"
      vm-only:
        - "%{libdir}/ostree/ostree-prepare-root"
        - "%{libdir}/systemd/**"
        - "%{libdir}/tmpfiles.d/**"

variables:
  configure: |
    %{conf-cmd} %{conf-args} --with-static-compiler=gcc

config:
  install-commands:
    (>):
    - mkdir -p "%{install-root}%{libdir}"/systemd/system/
    - cp src/boot/*service "%{install-root}%{libdir}"/systemd/system/
    - cp src/boot/*path "%{install-root}%{libdir}"/systemd/system/

    - mkdir -p "%{install-root}%{libdir}"/tmpfiles.d
    - cp src/boot/ostree-tmpfiles.conf "%{install-root}%{libdir}"/tmpfiles.d/

sources:
- kind: git_tag
  url: github:ostreedev/ostree
  track: master
  ref: v2019.4-0-g9d39e7d91e8497987cad69a3fbed5c5fc91eebdc
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bsdiff:
      checkout: true
      url: github:mendsley/bsdiff

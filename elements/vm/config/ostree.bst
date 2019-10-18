kind: manual

build-depends:
- bootstrap-import.bst

runtime-depends:
- components/systemd.bst
- deploy-tools/ostree.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}/sysroot"
    ln -s sysroot/ostree "%{install-root}/ostree"
    ln -s var/home "%{install-root}/home"
    ln -s var/roothome "%{install-root}/root"

  - |
    install -Dm644 -t "%{install-root}/usr/lib/tmpfiles.d" ostree.conf

sources:
- kind: local
  path: files/vm/ostree-config

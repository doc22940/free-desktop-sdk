kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/autoconf.bst
  type: build
- filename: base/automake.bst
  type: build
- filename: base/libtool.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/libxslt.bst
  type: build
- filename: desktop/gtk-doc.bst
  type: build

config:
  install-commands:
    (>):
    - |
      cd %{install-root}%{bindir}
      for target in depmod insmod lsmod modinfo modprobe rmmod; do
        ln -sfv kmod $target
      done

sources:
- kind: git
  url: https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git
  track: master
  ref: 47a43bd84e51559b3c6d0345dda59913a08f6bbb # v25

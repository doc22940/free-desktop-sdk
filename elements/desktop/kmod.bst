kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/docbook-xsl.bst
  type: build
- filename: base/docbook-xml.bst
  type: build
- filename: base/libxslt.bst
  type: build
- filename: base/xz.bst

variables:
  conf-local:
    --with-xz \
    --with-zlib \
    --enable-tools

config:
  install-commands:
    (>):
    - |
      for tool in insmod rmmod lsmod modprobe modinfo depmod; do
        ln -s kmod "%{install-root}%{bindir}/${tool}"
      done

sources:
- kind: git_tag
  url: https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git
  track: master
  ref: v25-0-gaca4eca103d6699543f7ed663335c28c2e9908bb

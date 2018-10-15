kind: autotools
description: qemu.

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: fastboot/bootimg-tools/libfdt.bst
    type: build
  - filename: base/git.bst
    type: build
  - filename: base/glib.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: desktop/pixman.bst
    type: build

config:
  configure-commands:
    - |
      mkdir %{builddir}
      cd %{builddir}
      ../configure --prefix=%{prefix}

sources:
  - kind: git
    url: git://git.qemu.org/qemu.git
    ref: 38441756b70eec5807b5f60dad11a93a91199866 #v3.0.0


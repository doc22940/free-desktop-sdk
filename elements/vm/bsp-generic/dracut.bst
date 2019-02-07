kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/pkg-config.bst
  type: build
- filename: desktop/kmod.bst
- filename: desktop/asciidoc.bst
  type: build
- filename: base/cpio.bst
  type: runtime

variables:
  builddir: ''
  lib: 'lib'

sources:
- kind: git_tag
  url: https://git.kernel.org/pub/scm/boot/dracut/dracut.git
  track: master
  ref: 049-0-g225e4b94cbdb702cf512490dcd2ad9ca5f5b22c1

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/pkg-config.bst
  type: build
- filename: vm/linux-vm-boot/kmod.bst

variables:
  builddir: ''

sources:
- kind: tar
  url: https://mirrors.edge.kernel.org/pub/linux/utils/boot/dracut/dracut-048.tar.gz
  ref: bd18bd424e3e11e076a3265690c951b5a1f8859a3998269b6ba552298ec7e333

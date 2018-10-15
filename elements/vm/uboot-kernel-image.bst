kind: uboot_img
description: Create a deployment of the kernel image as a uboot image
depends:
- filename: vm/minimal-vm.bst
  type: build
- filename: vm/uboot-deploy-tools.bst
  type: build

variables:
  ramdisk: "boot/initramfs.gz"
  ramdisk_compression: "gzip"
  kernel: "boot/vmlinux-4.14.71"
  kernel_compression: "none"
  dtb: "boot/system.dtb"

config:
  base: vm/uboot-deploy-tools.bst
  input: vm/minimal-vm.bst

  create_mkimage_config:
    (<):
    - qemu-system-aarch64 -machine virt,dumpdtb="%{build-root}/%{dtb}" -display none
   


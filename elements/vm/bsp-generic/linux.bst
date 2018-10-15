kind: manual
description: Linux kernel configured for use in virtual machines.

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/bison.bst
  type: build
- filename: base/flex.bst
  type: build
- filename: base/openssl.bst
  type: build
- filename: base/bc.bst
  type: build
- filename: base/gzip.bst
  type: build

variables:
  (?):
  - target_arch == "aarch64":
      kernel_arch: arm64
  - target_arch == "i586":
      kernel_arch: i386
  - target_arch != "aarch64" and target_arch != "i586":
      kernel_arch: '%{arch}'

config:
  configure-commands:
    - make defconfig

  build-commands:
    - make ARCH="%{kernel_arch}" $MAKEFLAGS

  install-commands:
    - mkdir -p "%{install-root}"/boot
    - make INSTALL_PATH="%{install-root}"/boot install
    - make INSTALL_MOD_PATH="%{install-root}" modules_install

environment:
  LDFLAGS: ""

public:
  bst:
    integration-commands:
    - |
      if type depmod &> /dev/null; then
        cd /usr/lib/modules
        for version in *; do
          depmod -a "$version";
        done
      fi

sources:
  - kind: git
    url: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
    ref: linux-4.14.y


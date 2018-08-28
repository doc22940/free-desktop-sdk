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

  systemd-config: |
    CONFIG_DEVTMPFS=y \
    CONFIG_CGROUPS=y \
    CONFIG_INOTIFY_USER=y \
    CONFIG_SIGNALFD=y \
    CONFIG_TIMERFD=y \
    CONFIG_EPOLL=y \
    CONFIG_NET=y \
    CONFIG_SYSFS=y \
    CONFIG_PROC_FS=y \
    CONFIG_FHANDLE=y \
    CONFIG_CRYPTO_USER_API_HASH=y \
    CONFIG_CRYPTO_HMAC=y \
    CONFIG_CRYPTO_SHA256=y \
    CONFIG_SYSFS_DEPRECATED=n \
    CONFIG_UEVENT_HELPER_PATH="" \
    CONFIG_FW_LOADER_USER_HELPER=n \
    CONFIG_DMIID=y \
    CONFIG_BLK_DEV_BSG=y \
    CONFIG_NET_NS=y \
    CONFIG_USER_NS=y \
    CONFIG_IPV6=y \
    CONFIG_AUTOFS4_FS=y \
    CONFIG_TMPFS_XATTR=y \
    CONFIG_TMPFS_POSIX_ACL=y \
    CONFIG_EXT4_FS_POSIX_ACL=y \
    CONFIG_XFS_POSIX_ACL=y \
    CONFIG_BTRFS_FS_POSIX_ACL=y \
    CONFIG_SECCOMP=y \
    CONFIG_SECCOMP_FILTER=y \
    CONFIG_CHECKPOINT_RESTORE=y \
    CONFIG_CGROUP_SCHED=y \
    CONFIG_FAIR_GROUP_SCHED=y \
    CONFIG_CFS_BANDWIDTH=y \
    CONFIG_CGROUP_BPF=y \
    CONFIG_RT_GROUP_SCHED=n

config:
  configure-commands:
    - make defconfig %{systemd-config}

  build-commands:
    - make ARCH="%{kernel_arch}" $MAKEFLAGS

  install-commands:
    - mkdir -p "%{install-root}"/boot
    - make INSTALL_PATH="%{install-root}"/boot install
    - make INSTALL_MOD_PATH="%{install-root}" modules_install

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
  - kind: tar
    url: https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.16.8.tar.xz
    ref: e4faad7d987b10e97eaaa272ef135c6edea8f8260e12bc1b8d1c91a7e03c98fc

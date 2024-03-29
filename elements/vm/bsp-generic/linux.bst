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
- filename: vm/linux-vm-boot/kmod.bst

variables:
  bootdir: /boot
  (?):
  - target_arch == "aarch64":
      kernel_arch: arm64
  - target_arch == "i686":
      kernel_arch: i386
  - target_arch != "aarch64" and target_arch != "i686":
      kernel_arch: '%{arch}'

environment:
  ARCH: '%{kernel_arch}'

config:
  configure-commands:
  - |
    # Generate the default kernel config for the target architecture
    make defconfig

  - |
    # Modify the kernel config for additional features

    # Kernel Config Options
    scripts/config -e DEVTMPFS
    scripts/config -e CGROUPS
    scripts/config -e INOTIFY_USER
    scripts/config -e SIGNALFD
    scripts/config -e TIMERFD
    scripts/config -e EPOLL
    scripts/config -e NET
    scripts/config -e SYSFS
    scripts/config -e PROC_FS
    scripts/config -e FHANDLE

    # Kernel crypto/hash API
    scripts/config -e CRYPTO_USER_API_HASH
    scripts/config -e CRYPTO_HMAC
    scripts/config -e CRYPTO_SHA256

    # udev will fail to work with legacy sysfs
    scripts/config -d SYSFS_DEPRECATED

    # Boot is very slow with systemd when legacy PTYs are present
    scripts/config -d LEGACY_PTYS
    scripts/config -d LEGACY_PTY_COUNT

    # Legacy hotplug confuses udev
    scripts/config --set-str UEVENT_HELPER_PATH ""

    # Userspace firmware loading not supported
    scripts/config -d FW_LOADER_USER_HELPER

    # Some udev/virtualization requires
    scripts/config -e DMIID

    # Support for some SCSI devices serial number retrieval
    scripts/config -e BLK_DEV_BSG

    # Required for PrivateNetwork= in service units
    scripts/config -e NET_NS
    scripts/config -e USER_NS

    # Required for 9p support
    scripts/config -e NET_9P
    scripts/config -e NET_9P_VIRTIO
    scripts/config -e 9P_FS
    scripts/config -e 9P_FS_POSIX_ACL
    scripts/config -e VIRTIO_PCI

    # Strongly Recommended
    scripts/config -e IPV6
    scripts/config -e AUTOFS4_FS
    scripts/config -e TMPFS_XATTR
    scripts/config -e TMPFS_POSIX_ACL
    scripts/config -e EXT4_FS_POSIX_ACL
    scripts/config -e XFS_POSIX_ACL
    scripts/config -e BTRFS_FS_POSIX_ACL
    scripts/config -e SECCOMP
    scripts/config -e SECCOMP_FILTER
    scripts/config -e CHECKPOINT_RESTORE

    # Required for CPUShares= in resource control unit settings
    scripts/config -e CGROUP_SCHED
    scripts/config -e FAIR_GROUP_SCHED
  
    # Required for CPUQuota= in resource control unit settings
    scripts/config -e CFS_BANDWIDTH

    # Required for IPAddressDeny=, IPAddressAllow= in resource control unit settings
    scripts/config -e CGROUP_BPF

    # For UEFI systems
    scripts/config -e EFIVAR_FS
    scripts/config -e EFI_PARTITION

    # RT group scheduling (effectively) makes RT scheduling unavailable for userspace
    scripts/config -d RT_GROUP_SCHED

    # Required for 3D acceleration in qemu
    scripts/config -e CONFIG_DRM_VIRTIO_GPU

    # Required for systemd-nspawn
    scripts/config -e DEVPTS_MULTIPLE_INSTANCES

  build-commands:
  - |
    make

  install-commands:
  - |
    install -Dm644 $(make -s image_name) '%{install-root}%{bootdir}/vmlinuz'
    install -Dm644 System.map '%{install-root}%{bootdir}/System.map'
    make INSTALL_MOD_PATH='%{install-root}%{prefix}' modules_install

    rm %{install-root}%{indep-libdir}/modules/*/{source,build}

  (?):
  - target_arch in ["aarch64", "arm"]:
      install-commands:
        (>):
        - |
          make INSTALL_DTBS_PATH='%{install-root}%{bootdir}/dtbs' dtbs_install

public:
  bst:
    integration-commands:
    - |
      cd '%{indep-libdir}/modules'
      for version in *; do
        depmod -b '%{prefix}' -a "$version";
      done

    split-rules:
      devel:
        (>):
        - '%{bootdir}/System.map'

sources:
- kind: tar
  url: https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.26.tar.xz
  ref: bec45f66c94739596f2bbc35e89de7a2cbd407cf63b537970b52ab117db747fc

kind: manual

depends:
- filename: bootstrap-import.bst
  type: build
- filename: components/perl.bst
  type: build
- filename: components/nasm.bst
  type: build
- filename: components/util-linux.bst
  type: build

sources:
- kind: tar
  url: https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/Testing/6.04/syslinux-6.04-pre1.tar.xz
- kind: patch
  path: patches/syslinux/extlinux-fix-missing header.patch

config:
  build-commands:
  - make installer
  install-commands:
  - make INSTALLROOT="%{install-root}" MANDIR="%{mandir}" SBINDIR="%{sbindir}" install

public:
  bst:
    split-rules:
      runtime:
        (>):
        - |
          %{datadir}/syslinux
        - |
          %{datadir}/syslinux/*
        - |
          %{datadir}/syslinux/diag/*
        - |
          %{datadir}/syslinux/dosutil/*

      devel:
        (>):
        - |
          %{datadir}/syslinux/com32/**

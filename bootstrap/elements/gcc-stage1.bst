kind: autotools
description: GNU gcc Stage 1

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
  type: build
- filename: binutils-stage1.bst
  type: build

variables:
  prefix: "%{tools}"
  libdir: "%{tools}/lib"
  (?):
    - target_arch == "arm":
        conf-extra: |
          --with-mode=thumb \
          --with-fpu=vfpv3-d16 \
          --with-arch=armv7-a \
          --with-float=hard
  conf-args: |
    --prefix=%{prefix} \
    --build=$(sh /config/config.guess) \
    --host=$(sh /config/config.guess) \
    --target=%{triplet} \
    --with-newlib \
    --enable-multiarch \
    --with-sysroot=%{sysroot} \
    --without-headers \
    --disable-bootstrap \
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --disable-libstdcxx \
    --disable-decimal-float \
    --disable-libatomic \
    --disable-libgomp \
    --disable-libmpx \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libvtv \
    --disable-multilib \
    --enable-languages=c,c++ \
    %{conf-extra}

sources:
- kind: tar
  url: ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/snapshots/8-20180204/gcc-8-20180204.tar.xz
  ref: e289b8cd0f7b35948fc6170391ecc92ae8b36bd22f87df4d18662bc6f9ba3930
- kind: tar
  url: http://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
  directory: gmp
  ref: 87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912
- kind: tar
  url: http://ftp.gnu.org/gnu/mpfr/mpfr-3.1.6.tar.xz
  directory: mpfr
  ref: 7a62ac1a04408614fccdc506e4844b10cf0ad2c2b1677097f8f35d3a1344a950
- kind: tar
  url: http://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz
  directory: mpc
  ref: 617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3
- kind: patch
  path: elements/gcc-multiarch-os-dir.patch

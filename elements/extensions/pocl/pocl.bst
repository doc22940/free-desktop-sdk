kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/cmake.bst
  type: build
- filename: base/ninja.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/patch.bst
  type: build
- filename: base/libtool.bst
- filename: desktop/llvm6.bst
- filename: desktop/opencl.bst
- filename: extensions/pocl/hwloc.bst

variables:
  prefix: '/usr/lib/%{gcc_triplet}/GL/pocl'
  lib: 'lib'
  cmake-local: |
    -DENABLE_ICD:BOOL=TRUE \
    -DSINGLE_LLVM_LIB:BOOL=TRUE \
    -DPOCL_INSTALL_ICD_VENDORDIR:PATH="%{prefix}/OpenCL/vendors"

environment:
  PKG_CONFIG_PATH: "%{libdir}/pkgconfig:"

sources:
- kind: git
  track: v1.2
  url: github:pocl/pocl.git
  ref: 23a0eed447509a9cdc706f39302037ef67b160b1
- kind: patch
  path: patches/pocl-disable-some-clang-libs.patch

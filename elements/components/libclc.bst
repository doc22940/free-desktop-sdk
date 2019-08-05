kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/llvm.bst
  type: build
- filename: components/python3.bst
  type: build

config:
  configure-commands:
  - |
    cd libclc
    ./configure.py \
    --prefix=%{prefix} \
    --pkgconfigdir=%{libdir}/pkgconfig \
    --with-cxx-compiler=%{bindir}/g++

  build-commands:
  - |
    cd libclc
    make

  install-commands:
  - |
    cd libclc
    make -j1 DESTDIR="%{install-root}" install

sources:
- kind: git_tag
  track: release/9.x
  #exclude:
  #- llvmorg-*-rc*
  url: github:llvm/llvm-project.git
  ref: llvmorg-9.0.0-rc1-g6aa75a25bdeea9cdc4b04cdd91e82e680444bf4b
- kind: patch
  directory: libclc
  path: patches/libclc/libclc-force-configure-to-use-python3.patch

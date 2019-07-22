kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/opencl.bst
- filename: extensions/clinfo/khronos-headers.bst
  type: build

config:
  build-commands:
    - make
  install-commands:
    - make -j1 PREFIX=%{install-root}/app install

sources:
- kind: git_tag
  url: github:Oblomov/clinfo
  track: master

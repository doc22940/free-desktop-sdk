kind: manual

depends:
- filename: bootstrap-import.bst
- filename: desktop/opencl.bst
  type: build

config:
  build-commands:
    - make
  install-commands:
    - make PREFIX=%{install-root}/app install

sources:
- kind: git_tag
  url: github:Oblomov/clinfo
  ref: 2.2.18.04.06-0-g59d0daf898e48d76ccbb788acbba258fa0a8ba7c

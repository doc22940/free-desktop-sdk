kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/gettext.bst
    type: build

config:
  install-commands:
    - |
      cd %{builddir}
      make -j1 instroot="%{install-root}" install

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libelf.so"

sources:
  - kind: tar
    url: https://github.com/WolfgangSt/libelf
    ref: dbbf0eddb1f7d243f5f909cba13597ad76fc4fcb

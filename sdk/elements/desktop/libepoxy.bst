kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/mesa.bst
- filename: base/pkg-config.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libepoxy.so"

sources:
- kind: tar
  url: https://github.com/anholt/libepoxy/releases/download/1.5.0/libepoxy-1.5.0.tar.xz
  ref: 4c94995398a6ebf691600dda2e9685a0cac261414175c2adf4645cdfab42a5d5
  etag: '"63fe3847789258254dcd7e3fdb9e7f5e"'

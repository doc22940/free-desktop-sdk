kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/mesa.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/python3.bst
  type: build

variables:
  meson-local: >
    -Ddocs=false
    -Dglx=yes
    -Degl=yes
    -Dx11=true
    -Dtests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libepoxy.so'
  cpe:
    version: '1.5.3'

sources:
- kind: git_tag
  url: github:anholt/libepoxy/
  track: master
  ref: 1.5.3-0-g16b1481e00084682d5ae5d38178e3e418976dfae

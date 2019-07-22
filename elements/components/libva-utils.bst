kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/libva.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build

variables:
  meson-local: |
    -Ddrm=true \
    -Dwayland=true \
    -Dx11=true

sources:
- kind: git_tag
  url: github:intel/libva-utils.git
  track: v2.5-branch

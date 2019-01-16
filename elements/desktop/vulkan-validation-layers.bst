kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build
- filename: desktop/glslang.bst
  type: build
- filename: desktop/mesa.bst
- filename: desktop/spirv-tools.bst
  type: build
- filename: desktop/wayland.bst
- filename: desktop/vulkan-headers.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xcb.bst
- filename: desktop/xorg-lib-xrandr.bst

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DGLSLANG_INSTALL_DIR=%{prefix}

sources:
- kind: tar
  url: github:KhronosGroup/Vulkan-ValidationLayers/archive/v1.1.97.tar.gz
  ref: 83a99981dc9d0cd97c40de906425d082cd7bf5a52e97a479b8ffe140d231d0d4

kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: desktop/vulkan-headers.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xrandr.bst
- filename: desktop/wayland.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DBUILD_VKJSON=OFF \
    -DBUILD_WSI_MIR_SUPPORT=OFF \
    -DCMAKE_INSTALL_SYSCONFDIR:PATH=%{sysconfdir} \
    -DBUILD_TESTS=OFF \
    -DBUILD_WSI_XCB_SUPPORT=On \
    -DBUILD_WSI_XLIB_SUPPORT=On \
    -DBUILD_WSI_WAYLAND_SUPPORT=On \
    -DBUILD_DEMOS=OFF \
    -DBUILD_LAYERS=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvulkan.so'

sources:
- kind: tar
  url: github:KhronosGroup/Vulkan-Loader/archive/v1.1.97.tar.gz
  ref: fe76a062b408e0dddc9214a86b68774b744450f76fd6ccaa40eab9df1979db49
- kind: patch
  path: patches/vulkan-libdir-path.patch

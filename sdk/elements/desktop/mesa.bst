kind: meson

depends:
  - filename: base.bst
    type: build
  - filename: desktop/llvm5.bst
    type: build
  - filename: desktop/libdrm.bst
  - filename: desktop/xorg-proto-xorgproto.bst
  - filename: desktop/xorg-lib-xdamage.bst
  - filename: desktop/xorg-lib-xfixes.bst
  - filename: desktop/xorg-lib-xshmfence.bst
  - filename: desktop/xorg-lib-xxf86vm.bst
  - filename: desktop/wayland-protocols.bst
    type: build
  - filename: desktop/libglvnd.bst

variables:
  (?):
    - target_arch == "i586" or target_arch == "x86_64":
        gallium_drivers: "svga,swrast,nouveau,r600,r300,radeonsi"
        dri_drivers: "swrast,nouveau,radeon,r200,i915,i965"
        vulkan_drivers: "intel,amd"
    - target_arch == "arm" or target_arch == "aarch64":
        gallium_drivers: "swrast,nouveau,freedreno,vc4"
        dri_drivers: "swrast,nouveau,r200"
        vulkan_drivers: ""

  mesa-local: |
    -Dglvnd=true \
    -Degl=true \
    -Dgles1=false \
    -Dgallium-xvmc=false \
    -Dplatforms=x11,drm,surfaceless,wayland \
    -Dgbm=true \
    -Dgallium-opencl=disabled \
    -Dtexture-float=true \
    -Dllvm=true \
    -Ddri3=true \
    -Dgallium-drivers=%{gallium_drivers} \
    -Ddri-drivers=%{dri_drivers} \
    -Dvulkan-drivers=%{vulkan_drivers}

config:
  install-commands:
    (>):
      - |
        ln -s libEGL_mesa.so.0 %{install-root}%{libdir}/libEGL_indirect.so.0
        ln -s libGLX_mesa.so.0 %{install-root}%{libdir}/libGLX_indirect.so.0
        rm -f "%{install-root}%{libdir}"/libGLESv2*
        rm -f "%{install-root}%{libdir}/libGLX_mesa.so"
        rm -f "%{install-root}%{libdir}/libEGL_mesa.so"

sources:
  - kind: git
    url: https://anongit.freedesktop.org/git/mesa/mesa.git
    track: 18.0
    ref: 1e1734634bf2e5f6d16953dbf416cd9afdf4a145 #  mesa-18.0.0-rc4
  - kind: patch
    path: elements/desktop/mesa-glvnd-fix-gl-dot-pc.patch
  - kind: patch
    path: elements/desktop/mesa-Fix-linkage-against-shared-glapi.patch

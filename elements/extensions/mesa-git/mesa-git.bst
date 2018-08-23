kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/libva.bst
  type: build
- filename: desktop/xorg-lib-xdamage.bst
  type: build
- filename: desktop/xorg-lib-xfixes.bst
  type: build
- filename: desktop/xorg-lib-xshmfence.bst
  type: build
- filename: desktop/xorg-lib-xxf86vm.bst
  type: build
- filename: desktop/xorg-lib-xrandr.bst
  type: build
- filename: desktop/wayland-protocols.bst
  type: build
- filename: desktop/libglvnd.bst
  type: build
- filename: desktop/libvdpau.bst
  type: build
- filename: base/bison.bst
  type: build
- filename: base/flex.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/python3.bst
  type: build
- filename: base/python3-mako.bst
  type: build
- filename: base/gettext.bst
  type: build

- filename: extensions/mesa-git/llvm-git.bst
- filename: extensions/mesa-git/libdrm-git.bst

environment:
  # For libdrm
  PKG_CONFIG_PATH: "%{libdir}/pkgconfig:"
  # For llvm-config
  PATH: "%{bindir}:/usr/bin"

variables:
  prefix: "/usr/lib/%{gcc_triplet}/GL/mesa-git"
  lib: "lib"
  debugdir: "/usr/lib/debug"

  (?):
  - target_arch == "i686" or target_arch == "x86_64":
      gallium_drivers: "svga,swrast,nouveau,r600,r300,radeonsi,virgl"
      dri_drivers: "nouveau,r100,r200,i915,i965"
      vulkan_drivers: "intel,amd"
  - target_arch == "arm" or target_arch == "aarch64":
      gallium_drivers: "pl111,vc4,freedreno,etnaviv,imx,nouveau,tegra,virgl,swrast"
      dri_drivers: ""
      vulkan_drivers: ""

  meson-local: |
    -Dglvnd=true \
    -Dselinux=false \
    -Dosmesa=none \
    -Degl=true \
    -Dgles1=false \
    -Dgles2=true \
    -Dgallium-omx=disabled \
    -Dgallium-vdpau=true \
    -Dgallium-va=true \
    -Dgallium-xa=true \
    -Dgallium-xvmc=false \
    -Dplatforms=x11,drm,surfaceless,wayland \
    -Dshared-glapi=true \
    -Dgbm=true \
    -Dgallium-opencl=disabled \
    -Dglx=auto \
    -Dtexture-float=true \
    -Dllvm=true \
    -Ddri3=true \
    -Dgallium-drivers=%{gallium_drivers} \
    -Ddri-drivers=%{dri_drivers} \
    -Dvulkan-drivers=%{vulkan_drivers} \
    -Dxlib-lease=true

config:
  install-commands:
    (>):
    - |
      ln -s libEGL_mesa.so.0 %{install-root}%{libdir}/libEGL_indirect.so.0
      ln -s libGLX_mesa.so.0 %{install-root}%{libdir}/libGLX_indirect.so.0
      rm -f "%{install-root}%{libdir}"/libGLESv2*
      rm -f "%{install-root}%{libdir}/libGLX_mesa.so"
      rm -f "%{install-root}%{libdir}/libEGL_mesa.so"
      # Those files are provided by desktop/wayland.bst
      rm -f "%{install-root}%{libdir}"/libwayland-egl.so*
      rm -f "%{install-root}%{libdir}"/pkgconfig/wayland-egl.pc


    - |
      if [ -d "%{install-root}%{datadir}/vulkan" ]; then
        mv "%{install-root}%{datadir}/vulkan" "%{install-root}%{prefix}/vulkan"
      fi
      mv "%{install-root}%{datadir}/glvnd" "%{install-root}%{prefix}/glvnd"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgbm.so'
        - '%{libdir}/libglapi.so'
        - '%{libdir}/libOSMesa.so'
        - '%{libdir}/libwayland-egl.so'
        - '%{libdir}/libxatracker.so'
        - '%{libdir}/vdpau/libvdpau_*.so'
        - '%{libdir}/libMesaOpenCL.so'

sources:
- kind: git_tag
  url: freedesktop:mesa/mesa.git
  track: master
  track-tags: false
  ref: 19.0-branchpoint-2532-g4c332a1f9fa60fe0e587a07b7265766ed136e5ea
- kind: patch
  path: patches/mesa/fix-driver-rpath.patch

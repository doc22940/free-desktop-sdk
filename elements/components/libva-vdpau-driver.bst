kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libva.bst
- filename: components/libvdpau.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: tar
  url: https://www.freedesktop.org/software/vaapi/releases/libva-vdpau-driver/libva-vdpau-driver-0.7.4.tar.bz2
- kind: patch
  path: patches/libva-vdpau-driver/libva-vdpau-driver-0.7.4-glext-85.patch
- kind: patch
  path: patches/libva-vdpau-driver/libva-vdpau-driver-0.7.4-drop-h264-api.patch
- kind: patch
  path: patches/libva-vdpau-driver/libva-vdpau-driver-0.7.4-fix_type.patch
- kind: patch
  path: patches/libva-vdpau-driver/libva-vdpau-sigfpe-crash.patch
- kind: patch
  path: patches/libva-vdpau-driver/libva-vdpau-driver-0.7.4-include-linux-videodev2.h.patch

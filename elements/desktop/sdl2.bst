kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/libsamplerate.bst
- filename: desktop/dbus.bst
- filename: desktop/fcitx.bst
  type: build
- filename: desktop/ibus.bst
  type: build
- filename: desktop/libpulse.bst
- filename: desktop/libxkbcommon.bst
- filename: desktop/mesa.bst
- filename: desktop/wayland.bst
- filename: desktop/wayland-protocols.bst
  type: build
- filename: desktop/xorg-lib-x11.bst

variables:
  conf-local: |
    --enable-sdl-dlopen \
    --disable-arts \
    --disable-esd \
    --disable-nas \
    --disable-alsa \
    --disable-oss \
    --disable-sndio \
    --disable-libudev \
    --enable-video-wayland \
    --enable-wayland-shared=no \
    --disable-rpath

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/sdl2-config'
        - '%{libdir}/libSDL2.so'

sources:
- kind: tar
  url: https://www.libsdl.org/release/SDL2-2.0.10.tar.gz
  ref: b4656c13a1f0d0023ae2f4a9cf08ec92fffb464e0f24238337784159b8b91d57

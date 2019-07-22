kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/sdl2.bst

variables:
  conf-local: |
    --disable-gui

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_net.so'

sources:
- kind: tar
  url: https://www.libsdl.org/projects/SDL_net/release/SDL2_net-2.0.1.tar.gz

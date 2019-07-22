kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libflac.bst
- filename: components/libvorbis.bst
- filename: components/mpg123.bst
- filename: components/sdl2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_mixer.so'

sources:
- kind: tar
  url: https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.4.tar.gz

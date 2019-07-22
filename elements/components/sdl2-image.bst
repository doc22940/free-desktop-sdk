kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/sdl2.bst
- filename: components/jpeg.bst
- filename: components/libpng.bst
- filename: components/libtiff.bst
- filename: components/libwebp.bst

variables:
  conf-local: |
    --disable-jpg-shared \
    --disable-png-shared \
    --disable-tif-shared \
    --disable-webp-shared

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_image.so'

sources:
- kind: tar
  url: https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.4.tar.gz

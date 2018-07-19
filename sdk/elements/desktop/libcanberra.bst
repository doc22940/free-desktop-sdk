kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/pkg-config.bst
  type: build
- filename: base/libtool.bst
  type: build
- filename: base/libvorbis.bst
- filename: desktop/gtk3.bst
- filename: desktop/libpulse.bst

sources:
- kind: tar
  url: http://0pointer.de/lennart/projects/libcanberra/libcanberra-0.30.tar.xz
  ref: c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72

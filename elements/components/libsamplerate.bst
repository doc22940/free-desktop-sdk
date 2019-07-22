kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/sndfile.bst

variables:
  conf-local: |
    --enable-sndfile

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsamplerate.so'

sources:
- kind: tar
  url: http://www.mega-nerd.com/SRC/libsamplerate-0.1.9.tar.gz

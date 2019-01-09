kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/sndfile.bst

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
- kind: git
  url: https://github.com/erikd/libsamplerate.git
  track: master
  ref: 47bba2349807b3cf47bb9751052111fe73a61218

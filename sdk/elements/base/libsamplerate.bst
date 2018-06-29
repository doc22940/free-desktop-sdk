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
        - "%{libdir}/libsamplerate.so"

sources:
- kind: git
  url: https://github.com/erikd/libsamplerate/
  ref: 7dcc9bb727dae4e2010cdc6ef7cda101b05509a4

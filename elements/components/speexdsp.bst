kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  (?):
  - target_arch == "aarch64":
        # Without it, it tries to compile arm 32 bit assembly which
        # does not work.
      conf-local: |
        --disable-neon

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libspeexdsp.so'

sources:
- kind: git_tag
  url: https://git.xiph.org/speexdsp.git
  track: master
  match:
  - SpeexDSP-*
  exclude:
  - SpeexDSP-*rc*
  - SpeexDSP-*beta*

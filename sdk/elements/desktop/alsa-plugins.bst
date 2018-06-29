kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/alsa-lib.bst
  - filename: desktop/pulseaudio.bst
  - filename: base/pkg-config.bst
    type: build

variables:
  conf-local: |
      --disable-jack \
      --enable-pulseaudio \
      --disable-samplerate \
      --disable-avcodec \
      --with-speex=no

config:
  install-commands:
    (>):
      - |
        mv "%{install-root}%{datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example" "%{install-root}%{datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf"

sources:
  - kind: git
    url: https://github.com/Distrotech/alsa-plugins
    ref: 6f8e9f3f686809e73270cc0f8259905e6514073b

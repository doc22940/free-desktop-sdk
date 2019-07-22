kind: autotools

depends: 
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  builddir: ""

config:
  configure-commands:
  - ./autogen.sh %{conf-args}

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libwebrtc_audio_processing.so"

sources: 
- kind: git_tag
  url: freedesktop:pulseaudio/webrtc-audio-processing.git
  track: master
- kind: patch
  path: patches/webrtc-audio-processing/add-ppc-family-support.patch

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

# public:
#   bst:
#     split-rules:
#       devel:
#         (>):
#         - '%{libdir}/FIXME-1.0.so'

sources:
- kind: git_tag
  url: freedesktop:pulseaudio/webrtc-audio-processing
  track: 'v0.3.1'
  ref: v0.3.1-0-ge882a54

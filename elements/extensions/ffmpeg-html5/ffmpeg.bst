kind: manual
description: ffmpeg shipped in the ffmpeg-html5 extension, has html5 codecs enabled

(@):
- elements/config/ffmpeg.yml

variables:
  extra-vid-enc: h263,h264
  extra-hwaccels: h264_vaapi,h264_vdpau
  extra-parsers: h264
  extra-demuxers: h264,mov

  ffmpeg-prefix: '/usr'
  ffmpeg-libdir: '%{ffmpeg-prefix}/lib/ffmpeg'

config:
  install-commands:
    (>):
    - |
      chmod +x ffmpeg-codec-enable.sh
      mv ffmpeg-codec-enable.sh "%{install-root}%{ffmpeg-libdir}/enable.sh"

sources:
  (>):
  - kind: local
    path: files/ffmpeg-codec-enable.sh

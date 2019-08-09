kind: manual
description: ffmpeg shipped in the full-codecs extension, has full codecs enabled

(@):
- elements/config/ffmpeg.yml

variables:
  extra-aud-enc: wmav1,wmav2
  extra-aud-dec: ape,dca,eac3,mlp,tak,truehd,wmav1,wmav2
  extra-vid-enc: h263,h264,wmv1,wmv2
  extra-vid-dec: hevc,h263,h264,mpeg4,wmv1,wmv2
  extra-hwaccels: h264_vaapi,h264_vdpau,hevc_vaapi,hevc_vdpau
  extra-parsers: hevc,h264,dca,mpeg4video
  extra-demuxers: avi,h264,mov,m4v,m4a

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

kind: flatpak_image

depends:
- filename: extensions/full-codecs/ffmpeg.bst
  type: build

config:
  directory: '%{indep-libdir}/ffmpeg'
  metadata:
    Runtime:
      name: 'org.freedesktop.Platform.ffmpeg-full-codecs'

    ExtensionOf:
      ref: 'runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}'

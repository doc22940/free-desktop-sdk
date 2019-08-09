kind: flatpak_image

depends:
- filename: extensions/ffmpeg-full/ffmpeg.bst
  type: build

config:
  directory: '%{indep-libdir}/ffmpeg'
  metadata:
    Runtime:
      name: 'org.freedesktop.Sdk.ffmpeg-full'

    ExtensionOf:
      ref: 'runtime/org.freedesktop.Sdk/%{gcc_arch}/%{branch}'

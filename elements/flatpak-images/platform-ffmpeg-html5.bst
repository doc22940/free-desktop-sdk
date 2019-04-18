kind: flatpak_image

depends:
- filename: extensions/ffmpeg-html5/ffmpeg.bst
  type: build

config:
  directory: '%{indep-libdir}/ffmpeg'
  exclude:
  - debug

  metadata:
    Runtime:
      name: org.freedesktop.Platform.ffmpeg-html5

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}

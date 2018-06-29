kind: flatpak-image

depends:
 - filename: extensions/ffmpeg.bst
   type: build

config:
  directory: "%{libdir}/ffmpeg"

  metadata:
    Runtime:
      name: org.freedesktop.Platform.ffmpeg
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

    ExtensionOf:
      ref: org.freedesktop.Platform/%{gcc_arch}/%{branch}

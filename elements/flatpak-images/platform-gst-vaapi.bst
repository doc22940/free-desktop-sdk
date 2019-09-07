kind: flatpak_image

depends:
- filename: extensions/gst-vaapi/gstreamer-vaapi.bst
  type: build

config:
  directory: '%{libdir}/gstreamer-1.0'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.GStreamer.gst-vaapi
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}

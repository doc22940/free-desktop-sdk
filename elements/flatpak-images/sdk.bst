kind: flatpak_image

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - docs
  - locale

  metadata:
    Runtime:
      name: org.freedesktop.Sdk
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

    Environment:
      GI_TYPELIB_PATH: /app/lib/girepository-1.0
      GST_PLUGIN_SYSTEM_PATH: /app/lib/gstreamer-1.0:/usr/lib/extensions/gstreamer-1.0:%{libdir}/gstreamer-1.0
      XDG_DATA_DIRS: /app/share:/usr/share:/usr/share/runtime/share:/run/host/share
      LIBVA_DRIVER_NAME: ""

    Extension org.freedesktop.Platform.GL:
      versions: "18.08;1.4"
      version: "1.4"
      directory: "%{lib}/GL"
      subdirectories: "true"
      no-autodownload: "true"
      autodelete: "false"
      add-ld-path: "lib"
      merge-dirs: "vulkan/icd.d;glvnd/egl_vendor.d;OpenCL/vendors"
      download-if: "active-gl-driver"
      enable-if: "active-gl-driver"

    Extension org.freedesktop.Sdk.Debug:
      directory: lib/debug
      autodelete: 'true'
      no-autodownload: 'true'

    Extension org.freedesktop.Sdk.Docs:
      directory: share/runtime/docs
      autodelete: 'true'
      no-autodownload: 'true'

    Extension org.freedesktop.Sdk.Locale:
      directory: share/runtime/locale
      autodelete: 'true'
      locale-subset: 'true'

    Extension org.freedesktop.Platform.Timezones:
      directory: share/zoneinfo

    Extension org.freedesktop.Platform.GStreamer:
      directory: lib/extensions/gstreamer-1.0
      subdirectories: 'true'

    Extension org.freedesktop.Platform.Icontheme:
      directory: share/runtime/share/icons
      subdirectories: 'true'
      no-autodownload: 'true'
      version: '1.0'

    Extension org.gtk.Gtk3theme:
      directory: share/runtime/share/themes
      subdirectories: 'true'
      subdirectory-suffix: gtk-3.0
      no-autodownload: 'true'
      version: '3.22'
      download-if: active-gtk-theme

    Extension org.freedesktop.Platform.html5-codecs:
      directory: '%{lib}/ffmpeg'
      add-ld-path: lib

    Extension org.freedesktop.Sdk.Extension:
      subdirectories: 'true'
      directory: lib/sdk
      no-autodownload: 'true'
      add-ld-path: lib

    Extension org.freedesktop.Platform.VAAPI.Intel:
      directory: '%{lib}/dri/intel-vaapi-driver'
      autodelete: 'false'
      no-autodownload: 'true'
      download-if: have-intel-gpu

depends:
- filename: desktop-image.bst
  type: build
- filename: sdk-integration.bst
  type: build
- filename: linker-debuginfo.bst
  type: build
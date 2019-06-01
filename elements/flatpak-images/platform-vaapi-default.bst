kind: flatpak_image

depends:
  - filename: extensions/vaapi-default/vaapi-default.bst
    type: build

variables:
  prefix: "/usr/lib/%{gcc_triplet}/VAAPI"
  lib: "lib"
  debugdir: "/usr/lib/debug"

config:
  directory: "%{prefix}"
  exclude:
    - debug
    - docs
    - locale
    - devel

  metadata:
    Runtime:
      name: org.freedesktop.Platform.VAAPI.default
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}

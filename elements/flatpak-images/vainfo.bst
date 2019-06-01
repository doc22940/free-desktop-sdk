kind: flatpak_image

variables:
  prefix: /app

config:
  directory: "%{prefix}"

  metadata:
    Application:
      name: org.freedesktop.VAInfo
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}
      command: vainfo

    Context:
      shared: "ipc;"
      sockets: "x11;wayland;"
      devices: "dri;"

depends:
  - filename: extensions/vainfo/vainfo.bst
    type: build

kind: flatpak_image

depends:
  - filename: extensions/mesa-git/mesa-git.bst
    type: build

variables:
  prefix: "/usr/lib/%{gcc_triplet}/GL/mesa-git"
  lib: "lib"
  debugdir: "/usr/lib/debug"

config:
  directory: "%{prefix}"
  exclude:
    - debug
    - docs
    - locale

  metadata:
    Runtime:
      name: org.freedesktop.Platform.GL.mesa-git
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}

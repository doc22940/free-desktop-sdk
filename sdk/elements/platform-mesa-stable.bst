kind: flatpak-image
description: mesa-stable extension

config:
  directory: "%{prefix}"

  metadata:
    Application:
      name: org.freedesktop.Platform.GL.mesa-stable
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

depends:
  - filename: desktop/llvm5.bst
    type: build
  - filename: desktop/mesa.bst
    type: build

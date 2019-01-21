kind: flatpak_image

depends:
- filename: extensions/pocl/pocl.bst
  type: build

config:
  directory: '%{libdir}/GL/pocl'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.GL.pocl
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}

kind: flatpak_repo

depends:
- filename: deploy-tools/flatpak.bst
  type: build

- filename: flatpak-images/mesa-git.bst
  type: build

config:
  arch: '%{gcc_arch}'
  environment:
  - deploy-tools/flatpak.bst
  (?):
  - target_arch == 'i686':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.GL.mesa-git/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.mesa-git/x86_64/%{branch}

  - target_arch == 'arm':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.GL.mesa-git/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.mesa-git/aarch64/%{branch}

kind: filter

depends:
- filename: components/pipewire-base.bst
  type: build
- filename: bootstrap-import.bst
  type: runtime
- filename: components/alsa-lib.bst
  type: runtime
- filename: components/dbus.bst
  type: runtime
- filename: components/sdl2.bst
  type: runtime
- filename: components/systemd-libs.bst
  type: runtime

config:
  exclude:
  - daemon
  include-orphans: True

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpipewire-*.so'

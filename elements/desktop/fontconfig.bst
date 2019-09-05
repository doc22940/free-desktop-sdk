kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/freetype.bst
- filename: base/gperf.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build

variables:
  conf-local: |
    --with-templatedir="%{sysconfdir}/fonts/conf.avail"

config:
  install-commands:
    (>):
    - |
      install -m 0644 -p -T fontconfig-flatpak.conf %{install-root}%{sysconfdir}/fonts/conf.d/50-flatpak.conf

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfontconfig.so'

    integration-commands:
    - |
      if [ -d "%{datadir}/fonts" ]; then
        touch -d @0 "%{datadir}/fonts" /usr/share/fonts/*
        fc-cache -rs
      fi
  cpe:
    version: '2.13.92'

sources:
- kind: git_tag
  url: freedesktop:fontconfig/fontconfig
  track: master
  ref: 2.13.91-22-gfcada522913e5e07efa6367eff87ace9f06d24c8
- kind: local
  path: files/fontconfig-flatpak.conf
- kind: patch
  path: patches/fontconfig/03-drop-new-symbol.patch

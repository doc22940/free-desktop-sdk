kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/freetype.bst
- filename: components/gperf.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
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
    version: '2.13.1'

sources:
- kind: git_tag
  url: freedesktop:tagoh/fontconfig
  track: 2.13.1-flatpak-lts
  track-tags: false
  ref: 2.13.0-68-g704c5bdaca4be3b61b4df38087ec9bc17f9aa2d6
- kind: local
  path: files/fontconfig-flatpak.conf

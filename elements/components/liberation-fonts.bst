kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  fontdir: '%{install-root}%{datadir}/fonts'
  confdir: '%{install-root}/etc/fonts'

config:
  install-commands:
  - |
    install -d -m0755 "%{confdir}/conf.avail" "%{confdir}/conf.d" "%{fontdir}/liberation-fonts"
    install -p -m0644 fonts/*.ttf "%{fontdir}/liberation-fonts"
    for i in config/liberation-fonts-*.conf; do
      install -p -m0644 "$i" "%{confdir}/conf.avail/59-$(basename "$i")"
      ln -s "../conf.avail/59-$(basename "$i")" "%{confdir}/conf.d/59-$(basename "$i")"
    done

sources:
- kind: tar
  url: https://releases.pagure.org/liberation-fonts/liberation-fonts-ttf-2.00.1.tar.gz
  directory: fonts
- kind: local
  path: files/font-conf/liberation-fonts
  directory: config

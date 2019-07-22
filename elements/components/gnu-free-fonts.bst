kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  fontdir: '%{install-root}%{datadir}/fonts'
  confdir: '%{install-root}/etc/fonts'

config:
  install-commands:
  - |
    install -d -m0755 "%{confdir}/conf.avail" "%{confdir}/conf.d" "%{fontdir}/gnu-free"
    install -p -m0644 fonts/*.ttf "%{fontdir}/gnu-free"
    for i in config/gnu-free-*.conf; do
      install -p -m0644 "$i" "%{confdir}/conf.avail/69-$(basename "$i")"
      ln -s "../conf.avail/69-$(basename "$i")" "%{confdir}/conf.d/69-$(basename "$i")"
    done

sources:
- kind: zip
  url: ftp_gnu_org:freefont/freefont-ttf-20120503.zip
  directory: fonts
- kind: local
  path: files/font-conf/gnu-free-fonts
  directory: config

kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/glib.bst

config:
  install-commands:
    (>):
      # Provided by base/autoconf-archive.bst
      - rm "%{install-root}/%{datadir}/aclocal/ax_check_enable_debug.m4"
      - rm "%{install-root}/%{datadir}/aclocal/ax_code_coverage.m4"

sources:
  - kind: git
    url: https://github.com/GNOME/gnome-common.git
    ref: 1df0aa160b1ce6d1e1f01085253b665fe6d0d1ef # 3.18.0

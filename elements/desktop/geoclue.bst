kind: meson

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/json-glib.bst
  - filename: desktop/gtk-doc.bst
    type: build
  - filename: base/glib.bst
  - filename: desktop/gobject-introspection.bst
    type: build
  - filename: desktop/libsoup.bst
  - filename: base/buildsystem-meson.bst
    type: build

variables:
  meson-local: |
    -D3g-source=false \
    -Dcdma-source=false \
    -Dmodem-gps-source=false \
    -Dnmea-source=false \
    -Ddemo-agent=false

config:
  install-commands:
    (>):
      - |
        rm -r "%{install-root}%{datadir}/applications"
        rm -r "%{install-root}%{sysconfdir}/dbus-1/system.d"
        rm -r "%{install-root}%{libexecdir}"
        rm -r "%{install-root}%{datadir}/dbus-1/system-services"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{datadir}/dbus-1/interfaces/org.freedesktop.GeoClue2*"
          - "%{libdir}/libgeoclue-2.so"

sources:
  - kind: git
    url: https://gitlab.freedesktop.org/geoclue/geoclue.git
    ref: 4138a5e337b02a659152295de7bc00b5cbd99277 #  2.5.0

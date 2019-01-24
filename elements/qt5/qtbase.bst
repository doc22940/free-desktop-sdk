kind: make

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/python3.bst
  type: build
- filename: base/which.bst
  type: build
- filename: base/glib.bst
- filename: base/icu.bst
- filename: base/openssl.bst
- filename: base/sqlite.bst
- filename: desktop/dbus.bst
- filename: desktop/fontconfig.bst
- filename: desktop/gtk3.bst
- filename: desktop/harfbuzz.bst


variables:
  conf-local: |
    -prefix %{prefix} \
    -libdir %{libdir} \
    -nomake examples \
    -nomake tests \
    -confirm-license \
    -opensource \
    -shared \
    -platform linux-g++ \
    -optimized-qmake \
    -system-harfbuzz \
    -system-sqlite \
    -accessibility \
    -dbus-linked \
    -fontconfig \
    -glib \
    -icu \
    -openssl-linked \
    -no-pch \
    -no-rpath \
    -no-directfb \
    -no-linuxfb \
    -no-kms \
    -no-cups \
    -system-proxies \
    -gtk \
    -archdatadir /usr/lib/

config:
  configure-commands:
    - ./configure %{conf-local}

  build-commands:
    - make

  install-commands:
    - |
      make -j1 INSTALL_ROOT=%{install-root} install

    - |
      rm -f "%{install-root}%{libdir}"/*.a
      rm -f "%{install-root}%{libdir}/lib"/*.la

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/*.so"

sources:
- kind: git
  url: https://code.qt.io/qt/qtbase.git
  ref: v5.12.0-0-g13ed06640c6cf32ea8c784c896c6bf017053edb3

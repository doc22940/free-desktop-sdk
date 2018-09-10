kind: manual

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
    -platform \
    linux-g++ \
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
    -gtk

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
- kind: tar
  url: https://download.qt.io/official_releases/qt/5.9/5.9.6/submodules/qtbase-opensource-src-5.9.6.tar.xz
  ref: eed620cb268b199bd83b3fc6a471c51d51e1dc2dbb5374fc97a0cc75facbe36f

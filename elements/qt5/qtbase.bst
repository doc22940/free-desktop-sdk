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
- filename: base/giflib.bst
  type: build
- filename: base/glib.bst
  type: build
- filename: base/icu.bst
  type: build
- filename: base/openssl.bst
  type: build
- filename: base/pcre2.bst
  type: build
- filename: base/sqlite.bst
  type: build
- filename: desktop/cups.bst
  type: build
- filename: desktop/dbus.bst
  type: build
- filename: desktop/fontconfig.bst
  type: build
- filename: desktop/gtk3.bst
  type: build
- filename: desktop/harfbuzz.bst
  type: build
- filename: desktop/vulkan.bst
  type: build
- filename: desktop/xcb-util-image.bst
- filename: desktop/xcb-util-keysyms.bst
- filename: desktop/xcb-util-renderutil.bst
- filename: desktop/xcb-util-wm.bst
- filename: desktop/xorg-lib-xcb.bst

variables:
  conf-local: |
    -prefix %{prefix} \
    -libdir %{libdir} \
    -sysconfdir %{sysconfdir}/xdg \
    -archdatadir %{libdir}/qt5 \
    -datadir %{prefix}/share/qt5 \
    -docdir %{prefix}/share/doc/qt5 \
    -headerdir %{prefix}/include/qt5 \
    -plugindir %{libdir}/qt5/plugins \
    -plugin-sql-sqlite \
    -nomake examples \
    -nomake tests \
    -confirm-license \
    -opensource \
    -shared \
    -platform linux-g++ \
    -optimized-qmake \
    -syslog \
    -system-proxies \
    -system-harfbuzz \
    -system-sqlite \
    -accessibility \
    -cups \
    -dbus-linked \
    -fontconfig \
    -glib \
    -icu \
    -gtk \
    -openssl-linked \
    -no-directfb \
    -no-linuxfb \
    -no-kms \
    -no-pch \
    -no-rpath \
    -no-use-gold-linker

  (?):
    - target_arch == "x86_64":
        conf-arch: |
          -reduce-relocations
    - target_arch == "i686":
        conf-arch: |
          -reduce-relocations
    - target_arch == "arm":
        conf-arch: |
          -no-reduce-relocations \
          -optimize-size \
          -opengl es2
    - target_arch == "aarch64":
        conf-arch: |
          -no-reduce-relocations \
          -optimize-size \
          -opengl es2

config:
  configure-commands:
    - |
      sed -i "s|-O2|${CXXFLAGS}|" mkspecs/common/gcc-base.conf
      # This also sets default {C,CXX,LD}FLAGS for projects built using qmake
      sed -i -e "s|^\(QMAKE_CFLAGS_RELEASE.*\)|\1 ${CFLAGS}|" \
        mkspecs/common/gcc-base.conf
      sed -i -e "s|^\(QMAKE_LFLAGS_RELEASE.*\)|\1 ${LDFLAGS}|" \
       mkspecs/common/g++-unix.conf

      ./configure %{conf-local} %{conf-arch}

  build-commands:
    - make -j%{max-jobs}

  install-commands:
    - |
      make -j1 INSTALL_ROOT=%{install-root} install
      rm -f "%{install-root}%{libdir}"/*.a

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

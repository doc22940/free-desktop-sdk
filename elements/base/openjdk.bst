kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
- filename: base/openjdk-bootstrap.bst
- filename: base/which.bst
- filename: base/gzip.bst
- filename: base/tar.bst
- filename: base/unzip.bst
- filename: base/zip.bst
- filename: base/jpeg.bst
- filename: base/giflib.bst
- filename: base/libpng.bst
- filename: base/lcms.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xtst.bst
- filename: desktop/xorg-lib-xrender.bst
- filename: desktop/xorg-lib-xext.bst
- filename: desktop/xorg-lib-xt.bst
- filename: desktop/alsa-lib.bst
- filename: desktop/cups.bst
- filename: desktop/fontconfig.bst

variables:
    conf-local: |
        --with-boot-jdk=%{bindir}/bootstrap-jdk \
        --with-jvm-variants=server \
        --with-version-build=13 \
        --with-version-pre= \
        --with-version-opt= \
        --with-debug-level=release \
        --with-native-debug-symbols=internal \
        --enable-unlimited-crypto \
        --with-zlib=system \
        --with-libjpeg=system \
        --with-giflib=system \
        --with-libpng=system \
        --with-lcms=system \
        --with-stdc++lib=dynamic \
        --disable-javac-server \
        --disable-warnings-as-errors \
    make-args: |
        JAVAC_FLAGS=-g \
        LOG=trace \
        WARNINGS_ARE_ERRORS=-Wno-error \
        CFLAGS_WARNINGS_ARE_ERRORS=-Wno-error \
        images \
    make: make %{make-args}

config:
    configure-commands:
        - |
          chmod a+x configure
          ./configure %{conf-local}
    build-commands:
        - make %{make-args}

environment:
    MAKEFLAGS: ""

sources:
- kind: tar
  url: https://fedorapeople.org/~mbooth/jdk11/shenandoah-jdk11-shenandoah-jdk-11.0.1+13.tar.xz
  ref: 4e51152275bcaa9368392aa11c79f6bfd202cb5b6dee8a56232e3608c487339e

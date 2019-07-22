kind: autotools

depends:
- filename: components/mesa-headers.bst
  type: build

variables:
  prefix: /app
  lib: lib

  make-args: >-
    GLEW_DEST="%{install-root}%{prefix}"
    GLEW_PREFIX="%{prefix}"
    LIBDIR="%{install-root}%{libdir}"
    CFLAGS.EXTRA="${CFLAGS} -fPIC"
    LDFLAGS.EXTRA="${LDFLAGS}"
    STRIP=""

config:
  configure-commands: []

  build-commands:
  - |
    make %{make-args}

  install-commands:
  - |
    make -j1 install %{make-args}

sources:
- kind: tar
  url: sourceforge:projects/glew/files/glew/2.1.0/glew-2.1.0.tgz

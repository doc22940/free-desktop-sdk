kind: autotools

depends:
- filename: desktop/mesa.bst
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
  url: https://sourceforge.net/projects/glew/files/glew/2.1.0/glew-2.1.0.tgz
  ref: 04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95

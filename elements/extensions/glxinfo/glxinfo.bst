kind: manual

depends:
- filename: desktop/mesa.bst
  type: build

variables:
  prefix: /app
  gcc-args: -O2 -g -lX11 -lXext -lGLX -lGL -lpthread
  mesa-args: -DPACKAGE_VERSION=\"8.4.0\" -DPACKAGE_STRING=\"mesa-demos\ 8.4.0\" -DPACKAGE_BUGREPORT=\"https://bugs.freedesktop.org/enter_bug.cgi\?product=Mesa\&component=Demos\" -DPACKAGE_URL=\"\" -DPACKAGE=\"mesa-demos\" -DVERSION=\"8.4.0\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1

config:
  build-commands:
    -  |
       cd src/xdemos
       gcc -o glxinfo glxinfo.c glinfo_common.c  %{mesa-args} %{gcc-args}
       gcc -o glxgears glxgears.c glinfo_common.c %{mesa-args} %{gcc-args} -lm

  install-commands:
    - |
      mkdir -p  %{install-root}/app/bin
      install -m755 src/xdemos/{glxinfo,glxgears} %{install-root}/app/bin
      cat > %{install-root}/app/bin/glxinfo-short << EOF
      #!/bin/sh
      echo "GLX direct renderer:"
      glxinfo | grep ^OpenGL
      echo -e "\nGLX software renderer:"
      LIBGL_ALWAYS_SOFTWARE=TRUE glxinfo | grep ^OpenGL
      EOF
      chmod 755 %{install-root}/app/bin/glxinfo-short

sources:
- kind: git_tag
  url: freedesktop:mesa/demos.git
  track: master
  ref: mesa-demos-8.4.0-0-g317f67fe5e75c685330d536f158acf6260b473d1

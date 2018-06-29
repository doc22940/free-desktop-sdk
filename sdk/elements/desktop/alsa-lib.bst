kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/python3.bst
    type: build

variables:
  conf-local: |
    --disable-aload \
    --disable-alisp \
    --disable-old-symbols \
    --with-pythonlibs="-lpthread -lm -ldl -lpython3" \
    --with-pythonincludes=-I/usr/include/python3 \
    --with-pcm-plugins="hw ioplug extplug"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libasound.so"

sources:
  - kind: git 
    url: https://github.com/gittup/alsa-lib
    ref: 0f93d7bb0ff4559147e3e38683b55a9ebbdfea77

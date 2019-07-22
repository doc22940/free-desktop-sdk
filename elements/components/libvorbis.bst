kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libogg.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvorbis.so'
        - '%{libdir}/libvorbisfile.so'
        - '%{libdir}/libvorbisenc.so'
  cpe:
    patches:
    - CVE-2018-10392
    - CVE-2018-10393

sources:
- kind: git_tag
  url: github:xiph/vorbis.git
  track: master
- kind: patch
  path: patches/libvorbis/CVE-2018-10392.patch

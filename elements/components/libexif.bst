kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexif.so'

  cpe:
    version: '0.6.21'
    vendor: 'curtis_galloway'

sources:
- kind: git_tag
  url: github:libexif/libexif
  track: master
  match:
  - libexif-*

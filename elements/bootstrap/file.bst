kind: autotools

depends:
- filename: bootstrap/file-build-deps.bst
  type: build
- filename: bootstrap/zlib.bst
  type: runtime

(@): elements/bootstrap/target.yml

variables:
  conf-local: |
   --disable-libseccomp

config:
  configure-commands:
    (<):
      - autoreconf -ivf

  install-commands:
    (>):
    # Remove empty directory triggering BuildStream #647
    - |
      rm -rf "%{install-root}%{mandir}/man5"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmagic.so'

  cpe:
    version: '5.37'

sources:
- kind: git_tag
  url: github:file/file
  track: master

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/gettext.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build


public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblzma.so'

sources:
- kind: git_tag
  url: https://git.tukaani.org/xz.git
  track: v5.2
  ref: v5.2.4-0-gb5be61cc06088bb07f488f9baf7d447ff47b37c1

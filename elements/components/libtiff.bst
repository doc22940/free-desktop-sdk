kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}"
      mv "%{install-root}%{includedir}/tiffconf.h" "%{install-root}%{includedir}/%{gcc_triplet}/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtiff.so'
        - '%{libdir}/libtiffxx.so'

  cpe:
    patches:
    - CVE-2019-6128

sources:
- kind: git_tag
  url: gitlab:libtiff/libtiff.git
  track: master
- kind: patch
  path: patches/libtiff/CVE-2019-6128.patch

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

config:
  configure-commands:
  - |
    mkdir "%{builddir}"
    cd "%{builddir}"
    ../icu4c/source/configure %{conf-args}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libicudata.so'
        - '%{libdir}/libicui18n.so'
        - '%{libdir}/libicuio.so'
        - '%{libdir}/libicutest.so'
        - '%{libdir}/libicutu.so'
        - '%{libdir}/libicuuc.so'
  cpe:
    version: '64.2'
    product: international_components_for_unicode

sources:
- kind: git_tag
  url: github:unicode-org/icu
  track: master
  track-extra:
  - maint/maint-64
  exclude:
  - release-*-rc
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch

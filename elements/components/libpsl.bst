kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libidn2.bst
- filename: components/libunistring.bst
- filename: components/git.bst
  type: build
- filename: components/python3.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libpsl.so"

sources:
- kind: git_tag
  url: github:rockdaboot/libpsl
  track: master
  submodules:
    list:
      checkout: true
      url: github:publicsuffix/list
- kind: patch
  path: patches/libpsl/libpsl-Use-the-detected-PYTHON-version.patch

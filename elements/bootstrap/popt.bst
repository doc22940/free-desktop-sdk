kind: autotools

depends:
- filename: bootstrap/popt-build-deps.bst
  type: build
- filename: bootstrap/file.bst
  type: runtime

(@): elements/bootstrap/target.yml

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpopt.so'

sources:
- kind: tar
  url: http://ftp.rpm.org/mirror/popt/popt-1.16.tar.gz
- kind: patch
  path: patches/popt/popt-1.16-pkgconfig.patch

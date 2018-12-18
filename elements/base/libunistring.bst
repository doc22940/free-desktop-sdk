kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build


sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz
  ref: eb8fb2c3e4b6e2d336608377050892b54c3c983b646c561836550863003c05d7

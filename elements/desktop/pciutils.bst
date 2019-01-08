kind: manual

depends:
- filename: bootstrap-import.bst

config:
  build-commands:
    - |
      make OPT="${CFLAGS}" ZLIB=no SHARED=no PREFIX="%{prefix}" SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man SBINDIR=/usr/bin lib/libpci.a
      cp lib/libpci.a .
      make clean
      make OPT="${CFLAGS}" ZLIB=no SHARED=yes PREFIX="%{prefix}" SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man all

  install-commands:
    - |
      make SHARED=yes PREFIX="%{prefix}" SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man DESTDIR="%{install-root}" install install-lib

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpci.so'

sources:
- kind: git_tag
  url: https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git
  ref: v3.6.2-0-ge3832c8fc3efe41aff853d16cab488d38c3ac13f

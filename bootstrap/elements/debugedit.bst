kind: autotools

depends:
  - filename: dependencies/base-sdk.bst
    type: build
  - filename: gnu-config.bst
    type: build
  - filename: gcc-stage2.bst
    type: build
  - filename: debugedit-host.bst
    type: build

sysroots:
- path: /sysroot
  depends:
  - filename: file.bst
  - filename: popt.bst
  - filename: glibc.bst
  - filename: bzip2.bst
  - filename: elfutils.bst
  - filename: openssl-static.bst
    type: build

variables:
  builddir: ""
  host-triplet: "%{triplet}"
  build-triplet: "%{guessed-triplet}"
  conf-link-args: |
    --disable-shared \
    --disable-static
  conf-local: |
    --without-lua \
    --with-crypto=openssl \
    --without-archive \
    --with-external-db

config:
  configure-commands:
    (<):
      - |
        autoreconf -f -v -i

  build-commands:
    - |
      make include/rpm/argv.h
      make include/rpm/rpmbase64.h
      make include/rpm/rpmfileutil.h
      make include/rpm/rpmio.h
      make include/rpm/rpmkeyring.h
      make include/rpm/rpmlog.h
      make include/rpm/rpmmacro.h
      make include/rpm/rpmpgp.h
      make include/rpm/rpmsq.h
      make include/rpm/rpmstring.h
      make include/rpm/rpmstrpool.h
      make include/rpm/rpmsw.h
      make include/rpm/rpmurl.h
      make include/rpm/rpmutil.h
      make include/rpm/rpmtypes.h
      make include/rpm/rpmtag.h
      make -C misc libmisc.la
      make -C rpmio librpmio.la
      make debugedit

  install-commands:
    - |
      make -j1 install-rpmlibexecPROGRAMS DESTDIR="%{install-root}" rpmlibexec_PROGRAMS="debugedit" rpmlibexecdir="%{bindir}"

    - |
      %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        - "/**"

sources:
  - kind: tar
    url: http://ftp.rpm.org/releases/rpm-4.14.x/rpm-4.14.1.tar.bz2
    ref: 43f40e2ccc3ca65bd3238f8c9f8399d4957be0878c2e83cba2746d2d0d96793b
  - kind: patch
    path: patches/debugedit-disable-berkdb-check.patch
  - kind: patch
    path: patches/debugedit-disable-md2.patch

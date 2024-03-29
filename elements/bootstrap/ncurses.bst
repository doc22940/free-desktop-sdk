kind: autotools
description: GNU ncurses

depends:
- filename: bootstrap/ncurses-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/target.yml

config:
  configure-commands:
  - |
    mkdir ncurses-build &&
    cd ncurses-build &&
    ../configure \
    --build=%{guessed-triplet} \
    --host=%{triplet} \
    --disable-stripping \
    --libdir=%{libdir} \
    --with-pkg-config-libdir="%{libdir}/pkgconfig" \
    --disable-widec \
    --with-shared \
    --without-ada \
    --without-normal \
    --enable-pc-files \
    --with-termlib \
    --prefix=/usr \
    --disable-stripping \
    TIC_PATH="%{tools}/bin/tic"

  - |
    mkdir ncursesw-build &&
    cd ncursesw-build &&
    ../configure \
    --build=%{guessed-triplet} \
    --host=%{triplet} \
    --disable-stripping \
    --libdir=%{libdir} \
    --with-pkg-config-libdir="%{libdir}/pkgconfig" \
    --enable-widec \
    --with-shared \
    --without-ada \
    --without-normal \
    --enable-pc-files \
    --with-termlib \
    --prefix=/usr \
    --disable-stripping \
    TIC_PATH="%{tools}/bin/tic"

  build-commands:
  - |
    cd ncurses-build && %{make}

  - |
    cd ncursesw-build && %{make}

  install-commands:
  - |
    cd ncurses-build && %{make-install}

  - |
    cd ncursesw-build && %{make-install}

  - |
    find "%{install-root}" -name "lib*.a" -exec rm {} ";"

  - |
    %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtinfo.so'
        - '%{libdir}/libtinfow.so'
        - '%{libdir}/libformw.so'
        - '%{libdir}/libform.so'
        - '%{libdir}/libpanel.so'
        - '%{libdir}/libmenuw.so'
        - '%{libdir}/libmenu.so'
        - '%{libdir}/libcurses.so'
        - '%{libdir}/libncursesw.so'
        - '%{libdir}/libncurses.so'
        - '%{libdir}/libpanelw.so'

  cpe:
    patches:
      - CVE-2018-10754
      - CVE-2018-19211 # Duplicate of CVE-2018-10754

sources:
- kind: tar
  url: ftp_gnu_org:ncurses/ncurses-6.1.tar.gz
  ref: aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17
- kind: patch
  path: patches/ncurses/CVE-2018-10754.patch

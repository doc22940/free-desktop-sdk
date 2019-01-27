kind: manual

depends:
- filename: bootstrap-import.bst

config:
  build-commands:
   - |
     sed -i 's/\(__atomic_compare_exchange\)/\1_db/' src/dbinc/atomic.h
     cd build_unix/
     ../dist/configure --prefix=%{prefix} \
        --libdir=%{libdir} \
        --enable-shared --disable-static \
        --enable-cxx \
        --enable-compat185 \
        --enable-dbm \
        --enable-stl

     make -j%{max-jobs}

  install-commands:
  - |
    cd build_unix/
    make DESTDIR=%{install-root} \
      docdir=/%{prefix}/share/doc/db-5.3.28 \
      install

public:
  bst:
    split-rules:
      devel:
        (>):
          - '%{libdir}/libdb_cxx.so'
          - '%{libdir}/libdb.so'
          - '%{libdir}/libdb_stl.so'

  cpe:
    product: berkeleydb

sources:
- kind: tar
  url: http://download.oracle.com/berkeley-db/db-5.3.28.tar.gz
  ref: e0a992d740709892e81f9d93f06daf305cf73fb81b545afe72478043172c3628

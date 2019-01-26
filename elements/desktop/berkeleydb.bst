kind: manual

depends:
- filename: bootstrap-import.bst

config:
  build-commands:
   - |
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
    make install DESTDIR=%{install-root}
    rm -rf %{install-root}%{prefix}/docs

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
  url: http://download.oracle.com/berkeley-db/db-6.2.32.tar.gz
  ref: a9c5e2b004a5777aa03510cfe5cd766a4a3b777713406b02809c17c8e0e7a8fb

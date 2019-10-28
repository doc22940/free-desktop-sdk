kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/tcl.bst

variables:
  conf-local: |
    --enable-fts5 \
    CFLAGS="${CFLAGS} \
    -DSQLITE_ENABLE_COLUMN_METADATA=1 \
    -DSQLITE_SECURE_DELETE=1 \
    -DSQLITE_ENABLE_FTS3=1 \
    -DSQLITE_ENABLE_UNLOCK_NOTIFY=1 \
    -DSQLITE_ENABLE_DBSTAT_VTAB=1"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsqlite3.so'

  cpe:
    vendor: 'sqlite'
    version-match: '(\d)(\d\d)0(\d)00'
    patches:
    - CVE-2019-16168

sources:
- kind: git_tag
  url: github:sqlite/sqlite
  track: master
  ref: version-3.30.0-0-g228a52d973c5eae8557adfc5da3b5b1ebcffdbec

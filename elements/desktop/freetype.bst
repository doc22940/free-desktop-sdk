kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/libpng.bst
  - filename: desktop/harfbuzz.bst
  - filename: desktop/freetype-stage1.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/freetype-config"
          - "%{libdir}/libfreetype.so"

variables:
  conf-local: |
    --enable-freetype-config \
    --with-zlib=yes \
    --with-bzip2=yes \
    --with-png=yes \
    --with-harfbuzz=yes

  # Symbols are missing if we build in parallel. See #330.
  max-jobs: 1

# Work-around:

# MAXJOBS is in the environment-nocache. And it does not seem to be
# overridable. So we need to inject the value into another dummy
# environment variable to force rebuilding.
# It is important the cache key to depend on max-jobs, because
# the result is different with different values.
environment:
  DUMMY_MAXJOBS: "%{max-jobs}"

sources:
  - kind: tar
    url: https://download.savannah.gnu.org/releases/freetype/freetype-2.9.1.tar.bz2
    ref: db8d87ea720ea9d5edc5388fc7a0497bb11ba9fe972245e0f7f4c7e8b1e1e84d

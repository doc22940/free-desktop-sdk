kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    CXXFLAGS="$CXXFLAGS" \
    LDFLAGS="$LDFLAGS"

sources:
- kind: tar
  url: https://download-mirror.savannah.gnu.org/releases/lzip/lzip-1.20.tar.gz

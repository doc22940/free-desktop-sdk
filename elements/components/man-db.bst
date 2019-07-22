kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/less.bst
- filename: components/groff.bst
- filename: components/libpipeline.bst
- filename: components/gzip.bst
- filename: components/xz.bst
- filename: components/lzip.bst

variables:
  conf-local: |
    --disable-cache-owner

sources:
- kind: tar
  url: https://download-mirror.savannah.gnu.org/releases/man-db/man-db-2.8.3.tar.xz

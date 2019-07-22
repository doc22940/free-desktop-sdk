kind: autotools
description: jq JSON processor

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

config:
  configure-commands:
    (<) :
      - |
        cd modules/oniguruma
        autoreconf -v -f -i
        cd ../..

sources:
- kind: tar
  url: github:stedolan/jq/releases/download/jq-1.6/jq-1.6.tar.gz

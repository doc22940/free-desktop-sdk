kind: filter
description: an element for extracting gstreamer-vaapi without its runtime dependencies

depends:
- filename: components/gstreamer-vaapi.bst
  type: build

config:
  include-orphans: true

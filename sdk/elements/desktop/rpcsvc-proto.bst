kind: autotools

depends:
  - filename: base.bst
    type: build

sources:
  - kind: git
    url: https://github.com/thkukuk/rpcsvc-proto.git
    track: master
    ref: ac227230110d556f87013b99e6cc1e09761d01e1 #  1.3.1

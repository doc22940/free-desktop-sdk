kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  install-commands:
    - |
      bash install.sh \
        --prefix=/usr \
        --destdir="%{install-root}" \
        --disable-ldconfig

sources:
  - kind: tar
    (?):
      - target_arch == "x86_64":
          url: https://static.rust-lang.org/dist/rust-1.25.0-x86_64-unknown-linux-gnu.tar.gz
          ref: 06fb45fb871330a2d1b32a27badfe9085847fe824c189ddc5204acbe27664f5e
      - target_arch == "i586":
          url: https://static.rust-lang.org/dist/rust-1.25.0-i686-unknown-linux-gnu.tar.gz
          ref: 56c5ffdca29f8a3657d012d24644fd335405d7dac0b720b17f6321111f9c0e55
      - target_arch == "aarch64":
          url: https://static.rust-lang.org/dist/rust-1.25.0-aarch64-unknown-linux-gnu.tar.gz
          ref: 19a43451439e515a216d0a885d14203f9a92502ee958abf86bf7000a7d73d73d
      - target_arch == "arm":
          url: https://static.rust-lang.org/dist/rust-1.25.0-arm-unknown-linux-gnueabihf.tar.gz
          ref: eb54299b460877b3f0e8d501e753c996f94bd6569b73920b7f20c65975c0ec3f

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
          url: https://static.rust-lang.org/dist/cargo-0.26.0-x86_64-unknown-linux-gnu.tar.gz
          ref: 9ba227f2364f618dc9415dacf3a5dce17458e1cb9f6d4fe860416cb68db894e4
      - target_arch == "i586":
          url: https://static.rust-lang.org/dist/cargo-0.26.0-i686-unknown-linux-gnu.tar.gz
          ref: 200c24872796d19e14ecc1a71febc28e7c08b4cde35712e5154ec0d79350f81e
      - target_arch == "aarch64":
          url: https://static.rust-lang.org/dist/cargo-0.26.0-aarch64-unknown-linux-gnu.tar.gz
          ref: 8d354b4ad21b943f95c96f607af3857c402960a19a2a1ebac6f9f1a6877e4138
      - target_arch == "arm":
          url: https://static.rust-lang.org/dist/cargo-0.26.0-arm-unknown-linux-gnueabihf.tar.gz
          ref: f61e6570da4eb682a150aeca1e58c11a1bd0b0266806bd142ad16939adaea23a

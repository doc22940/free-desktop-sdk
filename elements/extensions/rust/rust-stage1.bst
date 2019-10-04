kind: manual

depends:
- filename: bootstrap-import.bst
  type: build

config:
  install-commands:
  - |
    bash install.sh \
      --prefix="%{prefix}" \
      --destdir="%{install-root}" \
      --disable-ldconfig

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  (?):
  - target_arch == "x86_64":
      url: https://static.rust-lang.org/dist/rust-1.37.0-x86_64-unknown-linux-gnu.tar.gz
      ref: cb573229bfd32928177c3835fdeb62d52da64806b844bc1095c6225b0665a1cb
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/rust-1.37.0-i686-unknown-linux-gnu.tar.gz
      ref: 74510e0e52a55e65a9f716673c2cda4d2bd427e2453541c6993c77c3ec04acf9
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/rust-1.37.0-aarch64-unknown-linux-gnu.tar.gz
      ref: 263ef98fa3a6b2911b56f89c06615cdebf6ef676eb9b2493ad1539602f79b6ba
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/rust-1.37.0-armv7-unknown-linux-gnueabihf.tar.gz
      ref: 5b87b877f0ed20c6a09ce26e7a15d8c61b26b62484b97e78a51099d0efefec98

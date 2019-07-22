kind: manual

(@):
- elements/extensions/rust/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: https://static.rust-lang.org/dist/rust-1.35.0-armv7-unknown-linux-gnueabihf.tar.xz

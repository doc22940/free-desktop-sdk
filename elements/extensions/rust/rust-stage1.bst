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

variables:
# Disable debug handling in stage1 which is unnecessary and can cause
# failures during dwz optimizations.
  strip-binaries: "true"

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  (?):
  - target_arch == "x86_64":
      url: https://static.rust-lang.org/dist/rust-1.38.0-x86_64-unknown-linux-gnu.tar.xz
      ref: 4e9a2ef90679a66c9f8c62b113b018866303645a69c4812d8290d8a7162ea190
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/rust-1.38.0-i686-unknown-linux-gnu.tar.xz
      ref: 5c488cea89cef760362868eb790896bdf31b3109e392f0d54b27b74bd214df33
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/rust-1.38.0-aarch64-unknown-linux-gnu.tar.xz
      ref: 6ab06ff04cc41e612dd55f3358a1239be8cceb0ad8018996d39ae3e3b23156d2
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/rust-1.38.0-armv7-unknown-linux-gnueabihf.tar.xz
      ref: c8b9ced4a6b6efe32ac41e2ec032f847223b48ead04dedd2172e08d98616a774
  - target_arch == "powerpc64le":
      url: https://static.rust-lang.org/dist/rust-1.38.0-powerpc64le-unknown-linux-gnu.tar.xz
      ref: 6c253cc0f9441ab6ef4c2457e0ef8748c076d7d1897ab8a8a7bbb00308603a2b

kind: import
description: Import the base freedesktop SDK
sources:
- kind: ostree
  url: https://sdk.gnome.org/repo/
  # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
  #gpg-key: keys/gnome-sdk.gpg
  (?):
  - build_arch == "x86_64":
      track: runtime/org.freedesktop.BaseSdk/x86_64/1.6
      ref: 91f3686e153b2969e7ac007570998602d92149fa043c2cd0685bc41f3630a64c
  - build_arch == "i586":
      track: runtime/org.freedesktop.BaseSdk/i386/1.6
      ref: 687e8492d3f843ad59200635e4837f1b5f583f6675a4d53e2cda8276a28771c0
  - build_arch == "aarch64":
      track: runtime/org.freedesktop.BaseSdk/aarch64/1.6
      ref: 317d68402253ff7f949fb020b655e5121bfd203d0331f35b4f9867d3a7143f5f
  - build_arch == "arm":
      track: runtime/org.freedesktop.BaseSdk/arm/1.6
      ref: 7323128f089044c42738eea3915d5871f14def6b8ba18a6629eaa10ae20ef5f6

config:
  source: files
  target: usr

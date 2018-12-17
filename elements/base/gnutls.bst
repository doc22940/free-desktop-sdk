kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/libtasn1.bst
- filename: base/libunistring.bst
- filename: base/libidn2.bst
- filename: base/nettle.bst
- filename: base/p11-kit.bst
- filename: base/git-minimal.bst
  type: build
- filename: base/gperf.bst
  type: build
- filename: base/patch.bst
  type: build

variables:
  conf-local: |
    --disable-doc \
    --with-default-trust-store-pkcs11="pkcs11:"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgnutls.so'
        - '%{libdir}/libgnutlsxx.so'

sources:
- kind: git
  url: https://gitlab.com/gnutls/gnutls.git
  ref: gnutls_3_6_5-0-g4353ea025ae032887f3e8cf5aadace25662c6b35
  submodules:
   gnulib:
     checkout: True
     url: https://gitlab.com/libidn/gnulib-mirror.git
   tests/suite/tls-fuzzer/python-ecdsa:
     checkout: True
     url: https://github.com/warner/python-ecdsa
   tests/suite/tls-fuzzer/tlsfuzzer:
     checkout: True
     url: github:tomato42/tlsfuzzer.git
   tests/suite/tls-fuzzer/tlslite-ng:
     checkout: True
     url: github:tomato42/tlslite-ng.git

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gnutls.bst
- filename: base/openssl.bst
- filename: base/krb5.bst
- filename: base/nss.bst

# Curl must be configured --with-ca-bundle in order to find the
# correct certificate bundle at runtime, which is later generated
# by update-ca-certificates. Other applications such as git, rely
# on curl knowing the default location of the certs.

variables:
  conf-local: |
    --with-ca-bundle=%{ca_path} \
    --with-gnutls \
    --with-ssl \
    --with-nss \
    --with-gssapi \
    --enable-debug \
    --enable-optimize \
    --disable-warnings \
    --disable-curldebug

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcurl.so'

  cpe:
    version: '7.65.3'
    patches:
    - CVE-2019-5481
    - CVE-2019-5482

sources:
- kind: git_tag
  url: github:curl/curl.git
  track: master
  ref: curl-7_65_3-0-gaa73eb47bc8583070734696b25b34ad54c2c1f5e
- kind: patch
  path: patches/curl/security-read_data-fix-bad-realloc.patch
- kind: patch
  path: patches/curl/tftp-Alloc-maximum-blksize-and-use-default-unless-OA.patch

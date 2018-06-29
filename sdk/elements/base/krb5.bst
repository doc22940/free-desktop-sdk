kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
  type: build
- filename: base/bison.bst
  type: build
- filename: base/autoconf.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libcom_err.so"
        - "%{libdir}/libgssapi_krb5.so"
        - "%{libdir}/libgssrpc.so"
        - "%{libdir}/libk5crypto.so"
        - "%{libdir}/libkadm5clnt_mit.so"
        - "%{libdir}/libkadm5clnt.so"
        - "%{libdir}/libkadm5srv_mit.so"
        - "%{libdir}/libkadm5srv.so"
        - "%{libdir}/libkdb5.so"
        - "%{libdir}/libkrad.so"
        - "%{libdir}/libkrb5.so"
        - "%{libdir}/libkrb5support.so"
        - "%{libdir}/libverto.so"

config:
  configure-commands:
  - |
    mkdir "%{builddir}"
    cd src
    autoheader
    autoconf
    cd ../"%{builddir}"
    ../src/%{configure}

sources:
- kind: git
  url: https://github.com/krb5/krb5
  ref: 396c736c0add2e13f4a9aaaefc9c86445b701953

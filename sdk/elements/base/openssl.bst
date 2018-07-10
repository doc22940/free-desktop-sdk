kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/perl.bst

variables:
  builddir: ''
  openssl-target: linux-%{arch}
  (?):
    - target_arch == "i586":
        openssl-target: linux-generic32
    - target_arch == "arm":
        openssl-target: linux-generic32

config:
  configure-commands:
    - |
      ./Configure %{openssl-target} \
        --prefix=%{prefix} \
        --libdir=%{lib} \
        shared \
        threads

  install-commands:
    - |
      ls /usr/include
      make -j1 INSTALL_PREFIX="%{install-root}" install

    - |
      rm %{install-root}%{libdir}/lib*.a

    - mkdir -p %{install-root}%{datadir}
    - mv %{install-root}%{prefix}/ssl/man %{install-root}%{datadir}

    - |
      for man3 in "%{install-root}%{datadir}/man/man3"/*.3; do
        if [ -L "${man3}" ]; then
          ln -s "$(readlink "${man3}")ssl" "${man3}ssl"
          rm "${man3}"
        else
          mv "${man3}" "${man3}ssl"
        fi
      done

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/*"
          - "%{libdir}/libssl.so"
          - "%{libdir}/libcrypto.so"
          - "%{prefix}/ssl/misc/*"

sources:
  - kind: git
    url: https://github.com/openssl/openssl
    ref: 3098c3bd12530b11d2944e0bc8115f6471e4d41c

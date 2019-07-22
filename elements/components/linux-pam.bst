kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/flex.bst
  type: build

variables:
  pamconfdir: "%{sysconfdir}/pam.d"
  conf-local: |
    --includedir="%{includedir}/security"

config:
  install-commands:
    (>):
    - mkdir -p %{install-root}%{pamconfdir}
    - install -m 644 linux-pam-config/other %{install-root}%{pamconfdir}
    - install -m 644 linux-pam-config/system-auth %{install-root}%{pamconfdir}
    - install -m 644 linux-pam-config/password-auth %{install-root}%{pamconfdir}
    - install -m 644 linux-pam-config/fingerprint-auth %{install-root}%{pamconfdir}
    - install -m 644 linux-pam-config/smartcard-auth %{install-root}%{pamconfdir}
    - install -m 644 linux-pam-config/config-util %{install-root}%{pamconfdir}
    - install -m 644 linux-pam-config/postlogin %{install-root}%{pamconfdir}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpam.so'
        - '%{libdir}/libpam_misc.so'
        - '%{libdir}/libpamc.so'
      vm-only:
        # Most of this is only useful for VM.
        # We keep only libraries for dependencies.
        - '%{sysconfdir}'
        - '%{sysconfdir}/**'
        - '%{bindir}'
        - '%{bindir}/**'
        - '%{datadir}'
        - '%{datadir}/**'

sources:
- kind: tar
  url: github:linux-pam/linux-pam/releases/download/v1.3.1/Linux-PAM-1.3.1.tar.xz
- kind: local
  path: files/linux-pam-config
  directory: linux-pam-config

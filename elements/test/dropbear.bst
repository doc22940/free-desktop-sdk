kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

sources:
- kind: git
  url: https://github.com/mkj/dropbear.git
  track: DROPBEAR_2018.76
  ref: 64bd345a5d11e159ac74d45bd009f98ff1a50cf9

config:
  configure-commands:
    - |
      autoconf
      autoheader
      ./configure

  build-commands:
    - |
      %{make} PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"

  install-commands:
    - make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" install DESTDIR="%{install-root}"
    - mkdir -p "%{install-root}/etc"
    - mkdir -p "%{install-root}/etc/init.d"
    - mkdir -p "%{install-root}/etc/dropbear"
    - mkdir -p "%{install-root}/dev/pts"
    - |
      cat << EOF > "%{install-root}/etc/init.d/rcS"
      #!/bin/sh

      # Setup network interface and default gateway to match the qemu defaults:
      #     https://wiki.qemu.org/Documentation/Networking
      ifconfig eth0 10.0.2.15
      route add default gw 10.0.2.2 eth0

      # Mount pts for dropbear
      mount -t devpts devpts /dev/pts

      # Start dropbear:
      #  -R Create certificates as required
      #  -E Log errors to stderr
      #  -B Allow blank password (root has no password set)
      dropbear -REB
      EOF
    - chmod +x "%{install-root}/etc/init.d/rcS"

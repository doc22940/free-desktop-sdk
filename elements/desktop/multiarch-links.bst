kind: stack

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    (?):
      - target_arch == "x86_64":
          integration-commands:
            - |
              mkdir -p /usr/lib
              ln -sf i386-linux-gnu/ld-2.27.so /usr/lib/ld-linux.so.2
              ln -sf /app/lib/i386-linux-gnu /usr/lib/i386-linux-gnu
              rm -rf /usr/lib/debug/usr/lib/i386-linux-gnu
              mkdir -p /usr/lib/debug/usr/lib/
              ln -sf /app/lib/compat-debug/usr/lib/i386-linux-gnu /usr/lib/debug/usr/lib/
              mkdir -p /usr/lib/debug/app/lib/
              ln -sf /app/lib/compat-debug/usr/lib/i386-linux-gnu /usr/lib/debug/app/lib/

      - target_arch == "aarch64":
          integration-commands:
            - |
              mkdir -p /usr/lib
              ln -sf arm-linux-gnu/ld-2.27.so /usr/lib/ld-linux-armhf.so.3
              ln -sf /app/lib/arm-linux-gnueabihf /usr/lib/arm-linux-gnueabihf
              rm -rf /usr/lib/debug/usr/lib/arm-linux-gnueabihf
              mkdir -p /usr/lib/debug/usr/lib/
              ln -sf /app/lib/compat-debug/usr/lib/arm-linux-gnueabihf /usr/lib/debug/usr/lib/
              mkdir -p /usr/lib/debug/app/lib/
              ln -sf /app/lib/compat-debug/usr/lib/arm-linux-gnueabihf /usr/lib/debug/app/lib/

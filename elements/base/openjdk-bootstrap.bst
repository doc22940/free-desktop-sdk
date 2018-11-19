kind: manual

depends:
- filename: bootstrap-import.bst

variables:
    jdk: "%{install-root}%{bindir}/bootstrap-jdk"

config:
  install-commands:
    - |
      mkdir -p "%{jdk}"

    - |
      cp -ar * "%{jdk}"

sources:
- kind: tar
  url: https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_linux-x64_bin.tar.gz
  ref: f3b26abc9990a0b8929781310e14a339a7542adfd6596afb842fa0dd7e3848b2

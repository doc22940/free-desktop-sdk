kind: manual

depends:
- filename: bootstrap-import.bst

variables:
    jdk: "${install-root}/opt/bootstrap-jdk"

config:
    install-commands:
    - |
      mkdir -p "%{jdk}"

    - |
      cp -ar ./lib/jvm/java-openjdk/* "%{jdk}"

sources:
- kind: tar
  url: https://fedorapeople.org/~mbooth/bootstrap_jdk/bootstrap-openjdk-9.0.4.11-6.fc28.x86_64.tar.bz2
  ref: 65b6ef254fcdab54d63f1c212f255db2b94dc1bb3487c7796462a02772b3718d

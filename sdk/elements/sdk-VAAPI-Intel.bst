kind: flatpak-image

config:
  directory: "%{prefix}"
  
  metadata:
    Application:
      name: org.freedesktop.Platform
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

depends:
  - filename: VAAPI-Intel/vaapi-intel-driver.bst
    type: build


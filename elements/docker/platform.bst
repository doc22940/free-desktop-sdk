kind: script

depends:
- filename: bootstrap-import.bst
  type: build
- filename: components/tar.bst
  type: build
- filename: docker/platform-image.bst
  type: build

config:
  layout:
  - element: bootstrap-import.bst
    destination: "/"
  - element: components/tar.bst
    destination: "/"

  - element: docker/platform-image.bst
    destination: "/image"

  commands:
  - |
    cd /image
    tar cf "%{install-root}/image.tar" .

  - |
    cat <<\EOF >"%{install-root}/build.sh"
    #!/bin/bash
    dir="$(dirname "${0}")"
    exec docker image import "${dir}/image.tar" "freedesktop-sdk/platform:%{branch}" \
      -c 'ENV PATH=/app/bin:/usr/bin' \
      -c 'ONBUILD CMD ["/bin/bash", "-i"]' \
      -c 'ONBUILD ADD app/ /app/'
    EOF
    chmod +x "%{install-root}/build.sh"

kind: script

depends:
- filename: bootstrap-import.bst
  type: build

- filename: extensions/glxinfo/mesa-demos.bst
  type: build

config:
  layout:
  - element: bootstrap-import.bst
    destination: "/"

  - element: extensions/glxinfo/mesa-demos.bst
    destination: "%{install-root}"

  commands:
  - |
    cat <<EOF >"%{install-root}/Dockerfile"
    FROM freedesktop-sdk/platform:%{branch}
    CMD ["/app/bin/glxinfo"]
    EOF

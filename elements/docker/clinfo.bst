kind: script

depends:
- filename: bootstrap-import.bst
  type: build

- filename: extensions/clinfo/clinfo.bst
  type: build

config:
  layout:
  - element: bootstrap-import.bst
    destination: "/"

  - element: extensions/clinfo/clinfo.bst
    destination: "%{install-root}"

  commands:
  - |
    cat <<EOF >"%{install-root}/Dockerfile"
    FROM freedesktop-sdk/platform:%{branch}
    CMD ["/app/bin/clinfo"]
    EOF

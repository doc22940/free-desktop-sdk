kind: manual

depends:
- filename: bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir --parents %{install-root}%{includedir}
    cp -r CL/ %{install-root}%{includedir}

sources:
- kind: git_tag
  url: github:KhronosGroup/OpenCL-Headers.git
  track: master

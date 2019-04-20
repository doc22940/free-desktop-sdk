kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DSPIRV_WERROR=Off

config:
  install-commands:
    (>):
      - |
        mkdir --parents %{install-root}%{includedir}/spirv/unified1
        install -m 644 ./external/SPIRV-Headers/include/spirv/unified1/*.h* %{install-root}%{includedir}/spirv/unified1

public:
  bst:
    split-rules:
      devel:
        (>):
          - '%{bindir}/spirv-as'
          - '%{bindir}/spirv-cfg'
          - '%{bindir}/spriv-dis'
          - '%{bindir}/spirv-lesspipe.sh'
          - '%{bindir}/spirv-link'
          - '%{bindir}/spirv-opt'
          - '%{bindir}/spirv-stats'
          - '%{bindir}/spirv-val'

sources:
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Tools
  ref: v2019.2-0-g61dfd8492b6e324f684863ecbd79c299a06e6517
  # SPIRV-Headers should be in the same reference like spirv-headers.bst.
  # Only full git from headers make spirv-tools happy.
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers
  ref: 1.3.7-0-g2d08d12d8caf0a6bf9ea1f79c039b51b75b8aac4
  directory: external/SPIRV-Headers

kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/openjdk.bst
- filename: base/which.bst
  type: build

config:
  build-commands:
  - ./compile.sh
  - ./output/bazel build scripts:bazel-complete.bash
  - |
    cd output
    ./bazel shutdown

  install-commands:
  - install -m 755 -D scripts/packages/bazel.sh "%{install-root}%{bindir}/bazel"
  - install -m 755 -D output/bazel "%{install-root}%{bindir}/bazel-real"

sources:
- kind: git_tag
  url: github:bazelbuild/bazel.git
  ref: 0.19.1-0-geb2af0f699350ad187048bf814a95af23f562c77

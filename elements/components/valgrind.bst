kind: autotools
description: Tool to help find memory-management problems in programs

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gdb.bst
- filename: components/perl.bst
  type: build

variables:
  # valgrind does not like stack protector flags
  target_common_flags: >-
    %{common_flags} -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS
    -fexceptions -grecord-gcc-switches

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf

  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/valgrind"
      mv "%{install-root}%{includedir}/valgrind/config.h" "%{install-root}%{includedir}/%{gcc_triplet}/valgrind/"

public:
  cpe:
    version: '3.14.0'

sources:
- kind: git_tag
  url: https://repo.or.cz/valgrind.git
  track: master
- kind: patch
  path: patches/valgrind/valgrind-arm-hot_cpu.patch

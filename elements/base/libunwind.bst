kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libunwind*.so'

sources:
- kind: git_tag
  url: git://git.sv.gnu.org/libunwind.git
  track: v1.2-stable
  ref: v1.2-0-gcc247fc0a25051aae38cf319eb8eb3cfc54b20b8

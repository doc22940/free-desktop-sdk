kind: autotools

depends:
  - filename: bootstrap-import.bst

environment:
  # gdbm does not seem to work FORTIFY_SOURCE=2 (default project.conf flags)
  CPPFLAGS: "-O2"
  CFLAGS: "-O2 -g"
  CXXFLAGS: "-O2 -g"
  LDFLAGS: "-Wl,-z,relro,-z,now"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgdbm.so"

sources:
  - kind: tar
    url: ftp_gnu_org:gdbm/gdbm-1.16.tar.gz
    ref: c8a18bc6259da0c3eefefb018f8aa298fddc6f86c6fc0f0dec73270896ab512f

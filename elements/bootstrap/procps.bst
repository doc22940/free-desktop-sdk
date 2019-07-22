kind: autotools

depends:
- filename: bootstrap/procps-build-deps.bst
  type: build
- filename: bootstrap/ncurses.bst
  type: runtime

(@): elements/bootstrap/target.yml

variables:
  # Behavior of malloc cannot be tested when cross-compiling so
  # ac_cv_func_malloc_0_nonull is set manually.
  conf-local: |
    --with-ncurses \
    ac_cv_func_malloc_0_nonnull=yes \
    ac_cv_func_realloc_0_nonnull=yes

  builddir: ''

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libprocps.so'

sources:
- kind: git_tag
  url: gitlab:procps-ng/procps.git
  track: master
  exclude:
  - '*rc*'

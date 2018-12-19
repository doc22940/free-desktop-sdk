kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/flex.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/gmp.bst
- filename: base/libunistring.bst
- filename: base/libffi.bst
  type: build
- filename: base/gc.bst
- filename: base/libatomic_ops.bst

variables:
  conf-local: 
    CFLAGS="${CFLAGS} -DHAVE_GC_IS_HEAP_PTR -DHAVE_GC_MOVE_DISAPPEARING_LINK"

sources:
- kind: git
  url: http://git.sv.gnu.org/r/guile.git
  ref: v2.2.4-0-g791cae940afcb2b2eb2c167fe438be1dc1008a73

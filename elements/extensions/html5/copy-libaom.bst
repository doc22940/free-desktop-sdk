kind: script

depends:
- filename: base/aom.bst
  type: build

config:
  commands:
  - |
    soname="$(objdump -x %{libdir}/libaom.so | sed '/ *SONAME */{;s///;q;};d')"
    install -Dm644 -t "%{install-root}%{libdir}/ffmpeg/lib" "%{libdir}/${soname}"

kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  build-commands:
    - |
      for i in *.in; do
        sed "s/@@SDK_BRANCH@@/%{branch}/g" "${i}" >"$(basename "${i}" .in)"
      done

  install-commands:
    - |
      mkdir -p "%{install-root}%{indep-libdir}"
      install os-release "%{install-root}%{indep-libdir}"
      mkdir -p "%{install-root}%{sysconfdir}"
      ln -s "$(realpath --relative-to="%{install-root}%{sysconfdir}" "%{install-root}%{indep-libdir}/os-release")" %{install-root}%{sysconfdir}/os-release
      install issue "%{install-root}%{sysconfdir}"
      install issue.net "%{install-root}%{sysconfdir}"

sources:
  - kind: local
    path: files/os-release


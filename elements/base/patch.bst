kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/bison.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/git-minimal.bst
  type: build

public:
  cpe:
    patches:
    - CVE-2018-6951
    - CVE-2018-6952
    - CVE-2018-20969 # same fix as CVE-2019-13638
    - CVE-2018-1000156
    - CVE-2019-13636
    - CVE-2019-13638

sources:
- kind: git_tag
  url: savannah:patch.git
  track: master
  ref: v2.7.6-0-g40b387de08653a1e46872b8ac1a6a14b9b94feb3
  submodules:
    gnulib:
      checkout: True
      url: savannah:gnulib
- kind: patch
  path: patches/patch/CVE-2018-6951.patch
- kind: patch
  path: patches/patch/CVE-2018-6952.patch
- kind: patch
  path: patches/patch/allow-input-files-to-be-missing-for-ed-style-patches.patch
- kind: patch
  path: patches/patch/CVE-2018-1000156.patch
- kind: patch
  path: patches/patch/CVE-2019-13636.patch
- kind: patch
  path: patches/patch/CVE-2019-13638.patch
- kind: patch
  path: patches/patch/Do_not_leak_temporary_file.patch
- kind: patch
  path: patches/patch/Do_not_leak_temporary_file_on_failed_multi-file.patch

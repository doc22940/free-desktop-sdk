kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/bison.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build

public:
  cpe:
    patches:
    - CVE-2018-6951
    - CVE-2018-6952
    - CVE-2018-1000156

sources:
- kind: git_tag
  url: savannah:patch.git
  track: master
  submodules:
    gnulib:
      checkout: true
      url: savannah:gnulib.git
- kind: patch
  path: patches/patch/CVE-2018-6951.patch
- kind: patch
  path: patches/patch/CVE-2018-6952.patch
- kind: patch
  path: patches/patch/CVE-2018-1000156.patch

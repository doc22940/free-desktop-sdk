kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DENABLE_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib

sources:
- kind: tar
  url: https://download.kde.org/stable/frameworks/5.54/extra-cmake-modules-5.54.0.tar.xz

kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/python3.bst
  type: build
- filename: base/ruby.bst
  type: build

variables:
  etc_ocl_vendors: "/app/etc/OpenCL/vendors"
  conf-local: |
    --enable-custom-vendordir=%{etc_ocl_vendors} \
    --with-opencl-libdir \
    --with-opencl-libdir-gl \
    --disable-update-database

config:
  configure-commands:
    (<):
    - |
      rm -r khronos-headers
      mv khronos-headers-git khronos-headers
      rm khronos-headers/CL/{cl_dx9*.h,cl_d3d1*.h}
      %{autogen}

  install-commands:
    (>):
    - |
      mkdir -p %{install-root}%{sysconfdir}/OpenCL/
      ln -s %{etc_ocl_vendors} %{install-root}%{sysconfdir}/OpenCL/vendors
      mkdir -p %{install-root}%{includedir}
      cp -r khronos-headers/CL %{install-root}%{includedir}
      cd CLHPP
      python3 gen_cl_hpp.py -i input_cl.hpp -o  %{install-root}%{includedir}/CL/cl.hpp
      cp input_cl2.hpp %{install-root}%{includedir}/CL/cl2.hpp

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libOpenCL.so'

sources:
- kind: git_tag
  url: github:OCL-dev/ocl-icd
  track: v2.2.12
  ref: v2.2.12-0-g8bf11fd50d447511d1d54717b58813b18e92368e

- kind: git
  url: github:KhronosGroup/OpenCL-Headers
  ref: c60b351ca632da6670d78afdb3c365604efb8e89
  directory: khronos-headers-git

- kind: git
  url: github:KhronosGroup/OpenCL-CLHPP
  ref: 806646c283aad2db96212063478f0fb06abf0882
  directory: CLHPP

- kind: patch
  path: patches/opencl/opencl-extra-vendor-dirs.patch

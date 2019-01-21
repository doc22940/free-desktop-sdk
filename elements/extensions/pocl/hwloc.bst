kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  prefix: '/usr/lib/%{gcc_triplet}/GL/pocl'
  lib: 'lib'

sources:
- kind: tar
  url: https://download.open-mpi.org/release/hwloc/v2.0/hwloc-2.0.3.tar.bz2
  ref: e393aaf39e576b329a2bff3096d9618d4e39f416874390b58e6573349554c725

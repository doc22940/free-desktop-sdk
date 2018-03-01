kind: cmake

config:
  conf-local: |
    LIBVA_DRIVERS_PATH=/usr/lib/dri/intel-vaapi-driver

sources:
  - kind: tar
    url: https://www.freedesktop.org/software/vaapi/releases/libva-intel-driver/intel-vaapi-driver-1.8.2.tar.bz2
    sha256: 866cdf9974911e58b0d3a2cade29dbe7b5b68836e142cf092b99db68e366b702

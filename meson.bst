kind: autotools
description: json2Bst conversion for meson

depends:
	 - filename: autoconf-archive.bst
	 type: build

sources:
- kind: archive
	 url: https://pypi.python.org/packages/10/44/0899bf05d79a90a345252c38172d5359672119bc6125fe491a8263f173d1/meson-0.42.0.tar.gz
	 sha256: 4ef46250beea2af272a2ab5bdf835dd06e8c8d341c18529d502b5f7be0ac73fe
	 strip-components: 1

- kind: patch
	 path: meson-no-lib64.patch
	 strip-components: 1
	 use-git: False

config:
	 commands:
		- "python3 setup.py install"

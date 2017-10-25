kind: autotools
description: json2Bst conversion for xorg-x11-proto-record

depends:
	 - filename: autoconf-archive.bst
	 type: build
	 - filename: meson.bst
	 type: build
	 - filename: xorg-x11-util-macros.bst
	 type: build
	 - filename: xorg-x11-proto-bigreqs.bst
	 type: build
	 - filename: xorg-x11-proto-composite.bst
	 type: build
	 - filename: xorg-x11-proto-damage.bst
	 type: build
	 - filename: xorg-x11-proto-dmx.bst
	 type: build
	 - filename: xorg-x11-proto-evieext.bst
	 type: build
	 - filename: xorg-x11-proto-fixes.bst
	 type: build
	 - filename: xorg-x11-proto-fonts.bst
	 type: build
	 - filename: xorg-x11-proto-gl.bst
	 type: build
	 - filename: xorg-x11-proto-input.bst
	 type: build
	 - filename: xorg-x11-proto-kb.bst
	 type: build
	 - filename: xorg-x11-proto-randr.bst
	 type: build

sources:
- kind: archive
	 url: http://xorg.freedesktop.org/archive/individual/proto/recordproto-1.14.2.tar.bz2
	 sha256: a777548d2e92aa259f1528de3c4a36d15e07a4650d0976573a8e2ff5437e7370
	 strip-components: 1

- kind: shell
	 commands: ['cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'rm -f config.sub config.guess', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'rm -f config.sub config.guess', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'xmlcatalog --noout --create /etc/xml/catalog', "xmlcatalog --noout --add nextCatalog '' /etc/xml/docbook-xml.xml /etc/xml/catalog", "xmlcatalog --noout --add nextCatalog '' /etc/xml/docbook-xsl.xml /etc/xml/catalog", 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'mkdir -p /usr/lib/extra-links', 'ln -s /app/lib/ld-linux.so.2 /usr/lib/extra-links/ld-linux.so.2', 'mkdir -p /usr/lib/extra-links', 'ln -s /app/lib/ld-linux-armhf.so.3 /usr/lib/extra-links/ld-linux-armhf.so.3', 'mkdir -p /usr/lib/dri/intel-vaapi-driver', 'ln -s /usr/lib/dri/intel-vaapi-driver/i965_drv_video.so /usr/lib/dri/i965_drv_video.so']


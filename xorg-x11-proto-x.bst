kind: autotools
description: json2Bst conversion for xorg-x11-proto-x

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
	 - filename: xorg-x11-proto-record.bst
	 type: build
	 - filename: xorg-x11-proto-render.bst
	 type: build
	 - filename: xorg-x11-proto-resource.bst
	 type: build
	 - filename: xorg-x11-proto-scrnsaver.bst
	 type: build
	 - filename: xorg-x11-proto-video.bst
	 type: build
	 - filename: xorg-x11-proto-xcmisc.bst
	 type: build
	 - filename: xorg-x11-proto-xext.bst
	 type: build
	 - filename: xorg-x11-proto-xf86bigfont.bst
	 type: build
	 - filename: xorg-x11-proto-xf86dga.bst
	 type: build
	 - filename: xorg-x11-proto-xf86dri.bst
	 type: build
	 - filename: xorg-x11-proto-xf86misc.bst
	 type: build
	 - filename: xorg-x11-proto-xf86vidmode.bst
	 type: build
	 - filename: xorg-x11-proto-xinerama.bst
	 type: build

sources:
- kind: archive
	 url: http://xorg.freedesktop.org/archive/individual/proto/xproto-7.0.31.tar.bz2
	 sha256: c6f9747da0bd3a95f86b17fb8dd5e717c8f3ab7f0ece3ba1b247899ec1ef7747
	 strip-components: 1

- kind: shell
	 commands: ['cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'rm -f config.sub config.guess', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'rm -f config.sub config.guess', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'xmlcatalog --noout --create /etc/xml/catalog', "xmlcatalog --noout --add nextCatalog '' /etc/xml/docbook-xml.xml /etc/xml/catalog", "xmlcatalog --noout --add nextCatalog '' /etc/xml/docbook-xsl.xml /etc/xml/catalog", 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'mkdir -p /usr/lib/extra-links', 'ln -s /app/lib/ld-linux.so.2 /usr/lib/extra-links/ld-linux.so.2', 'mkdir -p /usr/lib/extra-links', 'ln -s /app/lib/ld-linux-armhf.so.3 /usr/lib/extra-links/ld-linux-armhf.so.3', 'mkdir -p /usr/lib/dri/intel-vaapi-driver', 'ln -s /usr/lib/dri/intel-vaapi-driver/i965_drv_video.so /usr/lib/dri/i965_drv_video.so']


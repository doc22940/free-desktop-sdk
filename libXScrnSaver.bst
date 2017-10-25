kind: autotools
description: json2Bst conversion for libXScrnSaver

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
	 - filename: xorg-x11-proto-x.bst
	 type: build
	 - filename: xorg-x11-proto-xproxymanagement.bst
	 type: build
	 - filename: xorg-x11-proto-dri2.bst
	 type: build
	 - filename: xorg-x11-proto-present.bst
	 type: build
	 - filename: xorg-x11-proto-dri3.bst
	 type: build
	 - filename: xorg-x11-xtrans-devel.bst
	 type: build
	 - filename: libXau.bst
	 type: build
	 - filename: xcb-proto.bst
	 type: build
	 - filename: libxcb.bst
	 type: build
	 - filename: libXdmcp.bst
	 type: build
	 - filename: libX11.bst
	 type: build
	 - filename: libXext.bst
	 type: build
	 - filename: libXv.bst
	 type: build
	 - filename: libXfixes.bst
	 type: build
	 - filename: libXdamage.bst
	 type: build
	 - filename: libXi.bst
	 type: build
	 - filename: libXtst.bst
	 type: build
	 - filename: libICE.bst
	 type: build
	 - filename: libSM.bst
	 type: build
	 - filename: libXt.bst
	 type: build
	 - filename: libvdpau.bst
	 type: build
	 - filename: libpciaccess.bst
	 type: build
	 - filename: libdrm.bst
	 type: build
	 - filename: libXxf86vm.bst
	 type: build
	 - filename: libxshmfence.bst
	 type: build
	 - filename: libXpm.bst
	 type: build
	 - filename: libXrender.bst
	 type: build

sources:
- kind: archive
	 url: http://xorg.freedesktop.org/archive/individual/lib/libXScrnSaver-1.2.2.tar.bz2
	 sha256: 8ff1efa7341c7f34bcf9b17c89648d6325ddaae22e3904e091794e0b4426ce1d
	 strip-components: 1

- kind: shell
	 commands: ['cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'rm -f config.sub config.guess', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'rm -f config.sub config.guess', 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'xmlcatalog --noout --create /etc/xml/catalog', "xmlcatalog --noout --add nextCatalog '' /etc/xml/docbook-xml.xml /etc/xml/catalog", "xmlcatalog --noout --add nextCatalog '' /etc/xml/docbook-xsl.xml /etc/xml/catalog", 'cp /usr/share/gnu-config/config.sub .', 'cp /usr/share/gnu-config/config.guess .', 'mkdir -p /usr/lib/extra-links', 'ln -s /app/lib/ld-linux.so.2 /usr/lib/extra-links/ld-linux.so.2', 'mkdir -p /usr/lib/extra-links', 'ln -s /app/lib/ld-linux-armhf.so.3 /usr/lib/extra-links/ld-linux-armhf.so.3', 'mkdir -p /usr/lib/dri/intel-vaapi-driver', 'ln -s /usr/lib/dri/intel-vaapi-driver/i965_drv_video.so /usr/lib/dri/i965_drv_video.so']


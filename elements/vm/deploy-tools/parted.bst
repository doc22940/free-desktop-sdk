kind: autotools

depends:
- bootstrap-import.bst
- base/util-linux.bst
- vm/deploy-tools/lvm2.bst

sources:
- kind: tar
  url: ftp_gnu_org:parted/parted-3.2.tar.xz
  ref: 858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4
- kind: patch
  path: patches/parted/0002-include.patch

# We have decided to stay with tarballs on this one, because the build
# system is too annoying when building from git. Parted  apparently
# uses rsync to download the po files (translations), so the build
# process  searches for rsync, to download them. However, buildstream
# doesn't let builds access the network, It will be need to change the
# parted build system so that it doesn't use rsync at all by patching it,
# but if you just patch out the calls to rsync, then we lose translations.
# So you'd have to rsync them beforehand, and add them to our repo as additional sources.

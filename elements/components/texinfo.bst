kind: autotools
description: GNU texinfo

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst

variables:
  conf-local: |
    PERL_EXT_CFLAGS="$CFLAGS" \
    PERL_EXT_LDFLAGS="$LDFLAGS"

public:
  bst:
    integration-commands:
    - |
      rm -f "%{infodir}/dir"
      for f in "%{infodir}"/*; do
        case "$(basename "${f}")" in
          *.png|*.jpg|*-[0-9])
            ;;
          *)
            install-info --info-dir="%{infodir}" "${f}"
            ;;
        esac
      done

sources:
- kind: tar
  url: ftp_gnu_org:texinfo/texinfo-6.6.tar.xz

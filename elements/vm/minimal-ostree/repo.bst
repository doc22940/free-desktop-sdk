kind: script

build-depends:
- deploy-tools/ostree.bst
- vm/deploy-tools.bst
- vm/minimal-ostree/filesystem.bst
- vm/minimal-ostree/initial-scripts.bst
- vm/prepare-image.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  ostree-branch: 'freedesktop-sdk-minimal-%{arch}'

environment:
  OSTREE_REPO: "%{install-root}/ostree/repo"

config:
  layout:
  - element: ''
    destination: '/tmp'
  - element: 'vm/deploy-tools.bst'
    destination: '/'
  - element: 'deploy-tools/ostree.bst'
    destination: '/'
  - element: 'vm/minimal-ostree/filesystem.bst'
    destination: '/sysroot'
  - element: 'vm/minimal-ostree/initial-scripts.bst'
    destination: '/'
  - element: ''
    destination: '/efi'

  commands:
  - |
    prepare-image.sh \
       --sysroot /sysroot \
       --seed "%{uuidnamespace}" \
       --rootsource /dev/gpt-auto-root \
       --efipath /boot \
       --rootpasswd "root" >"%{install-root}/vars"

  - mkdir -p "${OSTREE_REPO}"
  - ostree init --repo="${OSTREE_REPO}" --mode=archive
  - mv /sysroot/etc /sysroot/usr/etc
  - ostree commit --branch=%{ostree-branch} /sysroot

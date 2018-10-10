kind: stack
description: Stack of components in base-sdk

depends:
- filename: bootstrap-import.bst
- filename: base.bst
- filename: dpkg/dpkg.bst
- filename: dpkg/debhelper.bst
- filename: dpkg/strip-nondeterminism.bst

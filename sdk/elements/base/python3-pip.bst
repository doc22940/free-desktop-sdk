kind: distutils

depends:
  - filename: bootstrap-import.bst
  - filename: base/python3.bst
  - filename: base/python3-setuptools.bst
    type: build

variables:
  python: python3

sources:
  - kind: tar
    url: https://files.pythonhosted.org/packages/ae/e8/2340d46ecadb1692a1e455f13f75e596d4eab3d11a57446f08259dee8f02/pip-10.0.1.tar.gz
    ref: f2bd08e0cd1b06e10218feaf6fef299f473ba706582eb3bd9d52203fdbd7ee68

kind: make

depends:
- filename: bootstrap-import.bst
  type: build

sources:
- kind: tar
  url: http://pyropus.ca/software/memtester/old-versions/memtester-4.3.0.tar.gz
  ref: f9dfe2fd737c38fad6535bbab327da9a21f7ce4ea6f18c7b3339adef6bf5fd88

config:
  install-commands:
  - install -D -m 755 memtester %{install-root}%{prefix}/bin/memtester

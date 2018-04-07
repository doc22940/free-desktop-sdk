# If Cargo.lock file is not provided, generate it:
# cargo generate-lockfile
# Then run this script into the source directory. It will generate
# file "sources.yml", to insert into .bst element.
# Also "checksums" directory will be generated, it will need to be added into
# "cargo" directory of the project.

import pytoml
import json
import os

with open('Cargo.lock', 'r') as f:
    lock = pytoml.load(f)

with open('sources.yml', 'wb') as sources:
    metadata = lock['metadata']
    for package in lock['package']:
        name = package['name']
        version = package['version']
        if 'source' not in package:
            continue
        source = package['source']
        hash = metadata['checksum {} {} ({})'.format(name, version, source)]
        checksum_data = {'package': hash,
                         'files': {}}
        checksum_filename = 'checksums/{}-{}/.cargo-checksum.json'.format(name, version)
        os.makedirs(os.path.dirname(checksum_filename), exist_ok = True)
        with open(checksum_filename, 'w') as checksum_file:
            json.dump(checksum_data, checksum_file)
        lines = ['  - kind: tar',
                 '    url: https://static.crates.io/crates/{name}/{name}-{version}.crate'.format(name = name, version = version),
                 '    ref: {}'.format(hash),
                 '    directory: crates',
                 '    base-dir: ""',
                 '  - kind: local',
                 '    path: cargo/{}'.format(checksum_filename),
                 '    directory: crates/{}-{}'.format(name, version)]
        sources.write(('\n'.join(lines) + '\n').encode('ascii'))


# If Cargo.lock file is not provided, generate it:
# cargo generate-lockfile
# Then run this script into the source directory. It will generate
# file "sources.yml", to insert into .bst element.

import pytoml
import json
import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--subdir", help="use subdir configuration")
parser.add_argument("--output", help="output file", default="sources.yml")
args = parser.parse_args()

with open('Cargo.lock', 'r') as f:
    lock = pytoml.load(f)

with open(args.output, 'wb') as sources:
    sources.write('# THIS FILE IS GENERATED. DO NOT MODIFY.\n'.encode('ascii'))
    sources.write('sources:\n'.encode('ascii'))
    metadata = lock['metadata']
    for package in lock['package']:
        name = package['name']
        version = package['version']
        if 'source' not in package:
            continue
        source = package['source']
        hash = metadata['checksum {} {} ({})'.format(name, version, source)]
        lines = ['- kind: crate',
                 '  url: https://static.crates.io/crates/{name}/{name}-{version}.crate'.format(name = name, version = version),
                 '  ref: {}'.format(hash)]
        if args.subdir:
            lines.append('  subdir: {}'.format(args.subdir))
        sources.write(('\n'.join(lines) + '\n').encode('ascii'))

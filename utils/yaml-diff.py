#!/usr/bin/env python3

import sys
import contextlib
import tempfile
import subprocess
from ruamel import yaml

try:
    PATH, OLD_FILE, OLD_HEX, OLD_MODE, NEW_FILE, NEW_HEX, NEW_MODE = \
        sys.argv[1:]
except ValueError:
    print("Not enough args, unbalanced-tuple-unpacking")

def diff(path, old, new):
    subprocess.run(["diff", '-u',
                    '--label=a/{}'.format(path),
                    '--label=b/{}'.format(path),
                    old, new], check=False)

with contextlib.ExitStack() as stack:
    try:
        OLD_DATA = yaml.load(stack.enter_context(open(OLD_FILE, 'r')), Loader=yaml.Loader)
        NEW_DATA = yaml.load(stack.enter_context(open(NEW_FILE, 'r')), Loader=yaml.Loader)
    except AttributeError:
        diff(PATH, OLD_FILE, NEW_FILE)
    else:
        OLD_FORMATTED = stack.enter_context(tempfile.NamedTemporaryFile(mode='w'))
        NEW_FORMATTED = stack.enter_context(tempfile.NamedTemporaryFile(mode='w'))
        yaml.dump(OLD_DATA, OLD_FORMATTED, default_flow_style=False)
        yaml.dump(NEW_DATA, NEW_FORMATTED, default_flow_style=False)
        diff(PATH, OLD_FORMATTED.name, NEW_FORMATTED.name)

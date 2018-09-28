#!/usr/bin/env python3
# Copyright (C) 2018 Codethink Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  <http://www.apache.org/licenses/LICENSE-2.0>
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Authors:
#        Jim MacArthur <jim.macarthur@codethink.co.uk>


import click
import logging
import os
import stat
import sys

# Not all of these may be necessary - needs pruning
from _protos.build.bazel.remote.execution.v2 import remote_execution_pb2
from google.protobuf import any_pb2
from google.protobuf.message import DecodeError

logging.basicConfig(level=logging.INFO)

def match_serialised_object(contents):
    """Cycle through all the known PB2 object formats we might have in
    the cache and try to match them all. If none match, it's probably
    a plain text file.

    Note that it's quite possible for a user to put a serialised
    protocol buffer object into CAS as a normal file, and this method
    would fail in that case. The only reliable way to tell the type of
    an object is using context for the hash, which we don't have.

    """
    format_constructors = [ remote_execution_pb2.Directory, remote_execution_pb2.Action, remote_execution_pb2.Command, any_pb2.Any ]
    for f in format_constructors:
        try:
            object = f()
            object.ParseFromString(contents)
            logging.debug("This is a {}".format(f))
            return object
        except DecodeError:
            pass
    return None

def inspect_hash(context, hash):
    contents = get_raw_data_for_hash(context, hash)

    if len(contents)==0:
        click.echo("This is a zero-length file.")
        return

    object = match_serialised_object(contents)
    if object is None:
        click.echo("Object is likely to be a plain file.")
    else:
        click.echo("Deserialised object to: {}".format(object))

def get_object_for_hash(context, hash, constructor):
    o = constructor()
    contents = get_raw_data_for_hash(context, hash)
    o.ParseFromString(contents)
    return o

def get_raw_data_for_hash(context, hash):
    hashpath = os.path.join(context.obj['casdir'], 'objects', hash[:2], hash[2:])
    if os.path.isfile(hashpath):
        with open(hashpath, "rb") as f:
            contents = f.read()
        return contents
    else:
        click.echo("Either the hash specified is not present, or the CAS is corrupt.")
        click.Context.exit(2)

def extract_file(filedata, filename, targetdir, executable=False):
    target = os.path.join(targetdir, filename)
    with open(target, "wb") as f:
        f.write(filedata)

    if executable:
        # Set executable bit on top of whatever default permissions the file had
        filestat = os.stat(target)
        os.chmod(target, filestat.st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)

def create_link(targetdir, linkname, target):
    # TODO: This may fail on Windows if target does not exist yet;
    # Windows needs the additional parameter target_is_directory in that case.
    os.symlink(target, os.path.join(targetdir, linkname))

def extract_dir(context, dirObject, targetdir):
    logging.debug("Creating dir {}".format(targetdir))
    os.mkdir(targetdir)
    for dirNode in dirObject.directories:
        """ 'dot' turns up as a directory sometimes. This is usually an
        error when importing, but we ignore it anyway. """
        if dirNode.name != ".":
            subdir = os.path.join(targetdir, dirNode.name)
            d = get_object_for_hash(context, dirNode.digest.hash, remote_execution_pb2.Directory)
            extract_dir(context, d, subdir)
    for fileNode in dirObject.files:
        f = get_raw_data_for_hash(context, fileNode.digest.hash)
        extract_file(f, fileNode.name, targetdir, executable=fileNode.is_executable)
    for linkNode in dirObject.symlinks:
        create_link(targetdir, linkNode.name, linkNode.target)

def is_valid_cas_directory(directory):
    return os.path.exists(os.path.join(directory, "objects"))

def get_hash_for_ref(context, project, element, ref):
    refpath = os.path.join(context.obj['casdir'], 'refs', 'heads', project, element, ref)
    try:
        with open(refpath, 'rb') as f:
            digest = remote_execution_pb2.Digest()
            digest.ParseFromString(f.read())
            return digest.hash
    except FileNotFoundError:
        click.echo("No such ref for element {} in project {}".format(element, project))

@click.group()
@click.option('--casdir', envvar='CASDIR', default=None, type=click.Path())
@click.pass_context
def cli(context, casdir):
    if casdir is None:
        default_cas_url = "~/.cache/buildstream/artifacts/cas"
        casdir = os.path.expanduser(default_cas_url)
        if not is_valid_cas_directory(casdir):
            click.echo("No CAS directory specifed (use --casdir or CASDIR environment variable) and the default ({}) is not a CAS directory.".format(casdir))
            click.Context.exit(1)
        click.echo("Using the default directory {} for the content-addressable store.".format(casdir))
    else:
        casdir = os.path.expanduser(casdir)
        if not is_valid_cas_directory(casdir):
            click.echo("Specified CAS directory ({}) is not a CAS directory.".format(casdir))
            click.Context.exit(2)
    context.obj['casdir'] = casdir
    pass

@cli.command()
@click.argument('hash')
@click.pass_context
def inspect(context, hash):
    inspect_hash(context, hash)

@cli.command()
@click.argument('hash')
@click.argument('targetdir')
@click.pass_context
def extract(context, hash, targetdir):
    if os.path.exists(targetdir):
        click.echo("The target specified, '{}', already exists; you must delete it or specify a different path.".format(targetdir))
        return

    try:
        o = get_object_for_hash(context, hash, remote_execution_pb2.Directory)
        extract_dir(context, o, targetdir)
        click.echo("Extracted directory into {}.".format(targetdir))
        return
    except DecodeError:
        click.echo("Hash supplied is not a directory. Treating it as a file.")
        extract_file(contents, targetdir) # Could be done with hardlink...
        click.echo("Extracted file contents into {}.".format(targetdir))


@cli.command()
@click.argument('project')
@click.argument('element')
@click.argument('ref')
@click.argument('targetdir')
@click.pass_context
def checkout(context, project, element, ref, targetdir):
    hash = get_hash_for_ref(context, project, element, ref)
    if os.path.exists(targetdir):
        click.echo("The target specified, '{}', already exists; you must delete it or specify a different path.".format(targetdir))
        return

    try:
        o = get_object_for_hash(context, hash, remote_execution_pb2.Directory)
        extract_dir(context, o, targetdir)
        click.echo("Extracted directory into {}.".format(targetdir))
        return
    except DecodeError:
        click.echo("Hash supplied is not a directory. Treating it as a file.")
        extract_file(contents, targetdir) # Could be done with hardlink...
        click.echo("Extracted file contents into {}.".format(targetdir))

@cli.command()
@click.argument('project')
@click.argument('element')
@click.argument('ref')
@click.pass_context
def delete(context, project, element, ref):
    hash = str(get_hash_for_ref(context, project, element, ref))
    click.echo(hash)
    refpath = os.path.join(context.obj['casdir'], 'refs', 'heads', project, element, ref)
    hashpath = os.path.join(context.obj['casdir'], 'objects', hash[:2], hash[2:])
    os.remove(refpath)
    os.remove(hashpath)
    click.echo("Deleted object and ref for {}/{}/{}.".format(project, element, ref))


if __name__ == '__main__':
    cli(obj={})

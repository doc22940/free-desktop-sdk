import os
import re
import json
from collections import OrderedDict
from buildstream import Element, ElementError, Scope

def guess_version(sources):
    for source in sources:
        if source.get_kind() in ('tar', 'zip'):
            url = source.url
            filename = url.rpartition('/')[2]
            match = re.search(r'(\d+\.\d+(?:\.\d+)?)', filename)
            if match:
                return match.groups()[-1]
    else:
        pass


class CollectManifestElement(Element):

    def configure(self, node):
        self.node_validate(node, [
            'path'
        ])

        self.path = self.node_subst_member(node, 'path')
        self.manifest = OrderedDict()
        self.manifest['//NOTE'] = 'This is a generated manifest from buildstream files and not usable by flatpak-builder'
        self.manifest['modules'] = []

    def extract_source(self, dep):
        version = dep.get_variable('manifest-version')
        sources = list(dep.sources())
        if not sources:
            return None
        if not version:
            version = guess_version(sources)

        package = dep.get_variable('manifest-package')
        if not package:
            package = dep.name

        if version is None:
            #raise ElementError('Missing version to {}. Please add variable "manifest-version"'.format(dep))
            return None

        return {'name': package,
                'x-cpe': version}

    def scan_compose(self, top_dep, visited):
        for dep in top_dep.dependencies(Scope.BUILD,
                                        recurse=False):
            self.scan(dep, visited)

    def scan(self, top_dep, visited):
        for dep in top_dep.dependencies(Scope.RUN,
                                        visited=visited,
                                        recursed=True,
                                        recurse=True):
            if dep.get_kind() in 'compose':
                self.scan_compose(dep, visited)
            else:
                if dep.get_kind() in 'manual' and \
                   dep.name.endswith('-extract.bst'):
                        self.scan_compose(dep, visited)
                module = self.extract_source(dep)
                if module:
                    self.manifest['modules'].append(module)


    def preflight(self):
        visited = {}
        self.scan_compose(self, visited)

    def get_unique_key(self):
        key = {
            'path': self.path
        }
        return key

    def configure_sandbox(self, sandbox):
        pass

    def stage(self, sandbox):
        pass

    def assemble(self, sandbox):
        basedir = sandbox.get_directory()
        path = os.path.join(basedir, self.path.lstrip(os.path.sep))
        os.makedirs(os.path.dirname(path), exist_ok=True)

        with open(path, 'w') as o:
            json.dump(self.manifest, o, indent=2)

        return os.path.sep

def setup():
    return CollectManifestElement

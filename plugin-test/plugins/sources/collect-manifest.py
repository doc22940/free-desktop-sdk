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

def cleanup_provenance(data):
    if isinstance(data, dict):
        ret = OrderedDict()
        for k, v in data.items():
            if k != '__bst_provenance_info':
                ret[k] = cleanup_provenance(v)
        return ret
    elif isinstance(data, list):
        return [cleanup_provenance(v) for v in data]
    else:
        return data

class CollectManifestElement(Element):

    def configure(self, node):
        if 'path' in node:
            self.path = self.node_subst_member(node, 'path', None)
        else:
            self.path = None

    def preflight(self):
        pass

    def get_unique_key(self):
        key = {
            'path': self.path
        }
        return key

    def configure_sandbox(self, sandbox):
        pass

    def stage(self, sandbox):
        pass

    def extract_cpe(self, dep):
        cpe = dep.get_public_data('cpe')
        if cpe is None:
            cpe = {}

        if 'version' not in cpe:
            sources = list(dep.sources())
            if not sources:
                return None
            version = guess_version(sources)
            if version is None:
                #raise ElementError('Missing version to {}. Please add variable "manifest-version"'.format(dep))
                return None
            cpe['version'] = version

        if 'product' not in cpe:
            cpe['product'] = os.path.basename(os.path.splitext(dep.name)[0])

        return cpe

    def assemble(self, sandbox):
        manifest = OrderedDict()
        manifest['//NOTE'] = 'This is a generated manifest from buildstream files and not usable by flatpak-builder'
        manifest['modules'] = []

        visited = {}
        for top_dep in self.dependencies(Scope.BUILD,
                                         recurse=False):
            for dep in top_dep.dependencies(Scope.RUN,
                                            visited=visited,
                                            recursed=True,
                                            recurse=True):
                import_manifest = dep.get_public_data('cpe-manifest')
                if import_manifest:
                    manifest['modules'].extend(import_manifest['modules'])
                else:
                    cpe = self.extract_cpe(dep)
                    if cpe:
                        manifest['modules'].append({'name': dep.name,
                                                    'x-cpe': cpe})

        if self.path:
            basedir = sandbox.get_directory()
            path = os.path.join(basedir, self.path.lstrip(os.path.sep))
            os.makedirs(os.path.dirname(path), exist_ok=True)

            with open(path, 'w') as o:
                json.dump(cleanup_provenance(manifest), o, indent=2)

        self.set_public_data('cpe-manifest', manifest)
        return os.path.sep

def setup():
    return CollectManifestElement

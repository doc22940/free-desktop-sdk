import json
import tarfile
from buildstream import SourceError
import os.path
import buildstream
import importlib.util
_downloadablefilesource_src = os.path.join(os.path.dirname(buildstream.__file__), "plugins", "sources", "_downloadablefilesource.py")
_downloadablefilesource_spec = importlib.util.spec_from_file_location("._downloadablefilesource", _downloadablefilesource_src)
_downloadablefilesource = importlib.util.module_from_spec(_downloadablefilesource_spec)
_downloadablefilesource_spec.loader.exec_module(_downloadablefilesource)
DownloadableFileSource = _downloadablefilesource.DownloadableFileSource

class CrateSource(DownloadableFileSource):

    def configure(self, node):
        super().configure(node)

        self.node_validate(node, DownloadableFileSource.COMMON_CONFIG_KEYS)

    def stage(self, directory):
        try:
            with tarfile.open(self._get_mirror_file()) as tar:
                tar.extractall(path=directory)
                members = tar.getmembers()
            if len(members) != 0:
                dirname = members[0].name.split('/')[0]
                package_dir = os.path.join(directory, dirname)
                checksum_file = os.path.join(package_dir,
                                             ".cargo-checksum.json")
                with open(checksum_file, 'w') as f:
                    checksum_data = {'package': self.ref,
                                     'files': {}}
                    json.dump(checksum_data, f)

        except (tarfile.TarError, OSError) as e:
            raise SourceError("{}: Error staging source: {}".format(self, e)) from e

def setup():
    return CrateSource

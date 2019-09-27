import urllib.request
import urllib.parse
import sys
import json
import os

REGISTRY = sys.argv[1]
TAG = sys.argv[2]

DATA = {
    'service': 'registry.docker.io',
    'scope': f'repository:{REGISTRY}:pull',
    'grant_type': 'password',
    'client_id': 'script',
    'username': os.environ['DOCKER_HUB_USER'],
    'password': os.environ['DOCKER_HUB_PASSWORD']
}
ENCODED_DATA = urllib.parse.urlencode(DATA).encode('ascii')
#FIXME capital??
REQ = urllib.request.Request('https://auth.docker.io/token?{}'.format(urllib.parse.urlencode(DATA)))
with urllib.request.urlopen(REQ) as resp:
    JRSEP = json.load(resp)
    TOKEN = JRSEP['access_token']

HEADERS = {
    'Authorization': f'Bearer {TOKEN}',
    'Accept': 'application/vnd.docker.distribution.manifest.v2+json, application/vnd.docker.distribution.manifest.list.v2+json'
}
REQ = urllib.request.Request(f'https://registry.hub.docker.com/v2/{REGISTRY}/manifests/{TAG}',
                             headers=HEADERS)

with urllib.request.urlopen(REQ) as resp:
    print(resp.headers['Docker-Content-Digest'])

import argparse
import yaml
import json

parser = argparse.ArgumentParser(description='Process input file')

parser.add_argument('json', type=argparse.FileType('r'),
                   help='A json file to convert to Markdown')

args = parser.parse_args()

json_data = json.loads(args.json.read())

with open(args.json.name.replace('json', 'md'), 'w+') as yaml_file:
    for obj in json_data['modules']:
        if 'name' in obj:
            yaml_file.write('## {} \n'.format(obj['name']))
        if 'sources' in obj:
            for source in obj['sources']:
                if source['kind'] == 'tar' or source['kind'] == 'git' or source['kind'] == 'git_tag':
                    yaml_file.write('  - {} \n'.format(source['url']))
                    yaml_file.write('  - {} \n'.format(source['ref']))
        yaml_file.write('\n')

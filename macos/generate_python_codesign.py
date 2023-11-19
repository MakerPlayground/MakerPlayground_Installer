import json
import sys
import urllib.request

if len(sys.argv) != 2:
    print ('Usage: python generate_pio_codesign.py <log.json>')

with open(sys.argv[1]) as fp:
    errors = json.load(fp)

path = []
for error in errors['issues']:
    if (error['severity'] == 'error') and (error['path'] not in path) and ('python-portable-darwin_x86_64/' in error['path']):
        path.append(error['path'])

path = ['python-portable-darwin_x86_64/' + p.split('python-portable-darwin_x86_64/')[1] for p in path]
for p in path:
    print ('codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED"' + p)
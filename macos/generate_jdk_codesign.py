import json
import sys
import urllib.request

if len(sys.argv) != 2:
    print ('Usage: python generate_pio_codesign.py <log.json>')

with open(sys.argv[1]) as fp:
    errors = json.load(fp)

path = []
for error in errors['issues']:
    if (error['severity'] == 'error') and (error['path'] not in path) and ('Maker Playground.app' in error['path']):
        path.append(error['path'])

path = ['Maker\ Playground.app/' + p.split('Maker Playground.app/')[1] for p in path]
for p in path:
    print ('codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" ' + p)
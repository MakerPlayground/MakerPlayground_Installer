import json
import sys
import urllib.request

if len(sys.argv) != 2:
    print ('Usage: python generate_pio_codesign.py <url from Apple Notarization Server>')

response = urllib.request.urlopen(sys.argv[1])

path = []
errors = json.loads(response.read())
for error in errors['issues']:
    if error['path'] not in path:
        path.append(error['path'])

path = ['Maker\ Playground.app/' + p.split('Maker Playground.app/')[1] for p in path]
for p in path:
    print ('codesign --deep --force --timestamp --options runtime --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" ' + p)
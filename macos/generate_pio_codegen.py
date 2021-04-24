import json
import sys
import urllib.request

if len(sys.argv) != 2:
    print ('Usage: python generate_pio_codesign.py <url from Apple Notarization Server>')

response = urllib.request.urlopen(sys.argv[1])

path = []
errors = json.loads(response.read())
for error in errors['issues']:
    if error['path'] not in path and 'platformio/' in error['path'] and error['severity'] == "error":
        path.append(error['path'])

path = ['platformio/' + p.split('platformio/')[1] for p in path]
for p in path:
    print ('codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" ' + p)
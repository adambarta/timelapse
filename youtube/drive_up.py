#!/usr/bin/python

import httplib2
import pprint
import sys

from apiclient.discovery import build
from apiclient.http import MediaFileUpload
from oauth2client.client import OAuth2WebServerFlow
from oauth2client.file import Storage
from oauth2client.client import AccessTokenRefreshError
from oauth2client.tools import run

# Copy your credentials from the APIs Console
CLIENT_ID = '755888607133-nmfu42i0j75865i8j9npnfdf33e5v6bf.apps.googleusercontent.com'
CLIENT_SECRET = 'dbi1K-zsEGFONEU-YW5uXYbk'

# Check https://developers.google.com/drive/scopes for all available scopes
OAUTH_SCOPE = 'https://www.googleapis.com/auth/drive'

# Redirect URI for installed apps
REDIRECT_URI = 'urn:ietf:wg:oauth:2.0:oob'

# Path to the file to upload
#FILENAME = 'document.txt'
#FILENAME = '/srv/www/sets/%s' % sys.argv[1]
FILENAME = sys.argv[1]


flow = OAuth2WebServerFlow(CLIENT_ID, CLIENT_SECRET, OAUTH_SCOPE, REDIRECT_URI)

storage = Storage('credentials.dat')
credentials = storage.get()
if credentials is None or credentials.invalid:
	authorize_url = flow.step1_get_authorize_url()
	print 'Go to the following link in your browser: ' + authorize_url
	code = raw_input('Enter verification code: ').strip()
	credentials = flow.step2_exchange(code)
	storage.put(credentials)
	#credentials = run(flow, storage)


# Run through the OAuth flow and retrieve credentials
#flow = OAuth2WebServerFlow(CLIENT_ID, CLIENT_SECRET, OAUTH_SCOPE, REDIRECT_URI)
#authorize_url = flow.step1_get_authorize_url()
#print 'Go to the following link in your browser: ' + authorize_url
#code = raw_input('Enter verification code: ').strip()
#code = "4/oJhOW6KT18nYbfY1PzexXeBRdj1-.Mn3-HCAzIQoXOl05ti8ZT3Z3Ry8RfgI"
#credentials = flow.step2_exchange(code)

# Create an httplib2.Http object and authorize it with our credentials
http = httplib2.Http()
http = credentials.authorize(http)

drive_service = build('drive', 'v2', http=http)

# Insert a file
media_body = MediaFileUpload(FILENAME, mimetype='video/mp4', resumable=True)
body = {
  'title': 'Site Complex',
  'description': 'site complex construction',
  'mimeType': 'video/mp4'
}

file = drive_service.files().insert(body=body, media_body=media_body).execute()
pprint.pprint(file)


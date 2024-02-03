# Url

Uniform resource locator.

- _Url(aString)_

Construct a Url given a String.

	'http://cern.ch/'.Url.isUrl = true
	'http://cern.ch/'.Url.hostname = 'cern.ch'
	'http://cern.ch/'.Url.port = ''
	'http://cern.ch/'.Url.protocol = 'http:'

_Note_:
The type itself has the non-standard spelling _URL_, which is defined by the system.

* * *

See also: UrlSearchParams

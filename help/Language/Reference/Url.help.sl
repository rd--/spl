# Url -- uniform resource locator

- _Url(aString)_

Construct a Url given a String.

	'http://cern.ch/'.Url.isUrl = true
	'http://cern.ch/'.Url.hostname = 'cern.ch'
	'http://cern.ch/'.Url.port = ''
	'http://cern.ch/'.Url.protocol = 'http:'

* * *

See also: UrlSearchParams

Note: The type itself has the non-standard spelling _URL_, which is defined by the system.

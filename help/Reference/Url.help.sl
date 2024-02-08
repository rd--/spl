# Url

Uniform resource locator.

- _Url(aString)_

Construct a Url given a String.

```
>>> 'http://cern.ch/'.Url.isUrl
true

>>> 'http://cern.ch/'.Url.hostname
'cern.ch'

>>> 'http://cern.ch:8080/'.Url.host
'cern.ch:8080'

>>> 'http://cern.ch:8080/'.Url.port
'8080'

>>> 'http://cern.ch/'.Url.protocol
'http:'

>>> 'http://cern.ch/#home'.Url.hash
'#home'

>>> 'http://worldwideweb.cern.ch/browser/'.Url.pathname
'/browser/'
```

_Note_:
The type itself has the non-standard spelling _URL_, which is defined by the system.

* * *

See also: UrlSearchParams

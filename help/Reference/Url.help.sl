# Url

- _Url(aString)_

Construct a `Url`, a Uniform resource locator, given a `String`.

```
>>> 'http://cern.ch/'.Url.isUrl
true

>>> 'http://cern.ch/'.Url.hostName
'cern.ch'

>>> 'http://cern.ch:8080/'.Url.host
'cern.ch:8080'

>>> 'http://cern.ch:8080/'.Url.port
'8080'

>>> 'http://cern.ch/'.Url.protocol
'http:'

>>> 'http://cern.ch/#home'.Url.hash
'#home'

>>> 'http://worldwideweb.cern.ch/browser/'.Url.pathName
'/browser/'
```

File Url:

```
let url = '/home/rohan/sw/spl/help/Reference/Url.help.sl'.asFileUrl;
url.fetchText.then { :aString | aString.postLine }
```

_Note_:
The type itself has the non-standard spelling _URL_, which is defined by the system.

* * *

See also: href, hostName, Location, origin, pathName, UrlSearchParams

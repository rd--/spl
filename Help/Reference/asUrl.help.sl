# asUrl

- _asUrl(url)_
- _asUrl(url, base)_

Construct a `Url`.

At `String`:

```
>>> 'http://cern.ch/'.asUrl.isUrl
true
```

With base `Url`:

```
>>> let base = 'http://rfc-editor.org/';
>>> 'rfc/rfc1738.txt'.asUrl(base)
'http://rfc-editor.org/rfc/rfc1738.txt'.asUrl
```

Component qeuries:

```
>>> 'http://cern.ch/'.asUrl.hostName
'cern.ch'

>>> 'http://cern.ch:8080/'.asUrl.port
'8080'

>>> 'http://cern.ch/'.asUrl.protocol
'http:'

>>> 'http://cern.ch/#home'.asUrl.fragment
'#home'
```

* * *

See also: asFileUrl, fragment, href, hostName, Location, origin, pathName, query, Url

Categories: Network

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

* * *

See also: asFileUrl, fragment, href, hostName, Location, origin, pathName, query, Url

Guides: Network Functions

Categories: Network

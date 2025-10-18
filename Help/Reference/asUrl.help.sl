# asUrl

- _asUrl(s, b='')_

Construct a `Url` from the string _s_, with base _b_.

At `String`:

```
>>> 'http://cern.ch/'.asUrl.isUrl
true
```

With base `Url`:

```
>>> let b = 'http://rfc-editor.org/';
>>> 'rfc/rfc1738.txt'.asUrl(b)
'http://rfc-editor.org/rfc/rfc1738.txt'.asUrl
```

At `Url`:

```
>>> let u = Url('file:///etc/fstab');
>>> u.asUrl == u
true
```

* * *

See also: asFileUrl, fragment, href, hostName, Location, origin, pathName, query, Url

Guides: Network Functions

Categories: Network

# asUrl

- _asUrl(s, b='')_

Construct a `Url` from the string _s_, with base _b_.

At `String`:

```
>>> let s = 'http://cern.ch/';
>>> let u = s.asUrl;
>>> (u.isUrl, u, u.href)
(
	true,
	Url'http://cern.ch/',
	'http://cern.ch/'
)
```

With base `Url`:

```
>>> let b = 'http://rfc-editor.org/';
>>> 'rfc/rfc1738.txt'.asUrl(b)
Url'http://rfc-editor.org/rfc/rfc1738.txt'
```

At `Url`:

```
>>> let u = Url'file:///etc/fstab';
>>> u.asUrl == u
true
```

* * *

See also: asFileUrl, fragment, href, hostName, Location, origin, pathName, query, Url

Guides: Network Functions

Categories: Network

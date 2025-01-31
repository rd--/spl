# asFileUrl

- _asFileUrl(aString)_

Construct a file protocol `Url`.

```
>>> let url = '/A/B.C'.asFileUrl;
>>> (
>>> 	url.protocol,
>>> 	url.pathName,
>>> 	url.href
>>> )
(
	'file:',
	'/A/B.C',
	'file:///A/B.C'
)
```

Unix password file `Url`:

```
>>> '/etc/passwd'.asFileUrl
'file:///etc/passwd'.asUrl
```

Fetch text from password file Url:

~~~spl async=String
'/etc/passwd'
.asFileUrl
.fetchText
~~~

* * *

See also: asUrl, href, hostName, Location, origin, pathName, protocol, Url

Categories: Network

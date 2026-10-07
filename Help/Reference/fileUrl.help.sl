# fileUrl

- _fileUrl(s)_

Construct a file protocol `Url` given the file name string _s_.

```
>>> let url = '/A/B.C'.fileUrl;
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
>>> '/etc/passwd'.fileUrl
Url('file:///etc/passwd')
```

Fetch text from password file Url:

~~~spl async
'/etc/passwd'
.fileUrl
.fetchText
~~~

* * *

See also: Url, Location, href, hostName, origin, pathName, protocol

Guides: Network Functions

Categories: Network

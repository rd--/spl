# Url

`Url` is both a `Trait` and a `Type` representing a _Uniform Resource Locator_.

`Url` values are constructed using `asUrl`.

`Url` implements the `fragment`, `host`, `hostName`, `href`, `origin`, `pathName`, `port`, `protocol` and `query` methods.

```
>>> let url = 'A://B:0/C?D=E#F'.asUrl;
>>> (
>>> 	url.protocol,
>>> 	url.hostName,
>>> 	url.port,
>>> 	url.pathName,
>>> 	url.query,
>>> 	url.fragment
>>> )
('a:', 'B', '0', '/C', '?D=E', '#F')
```

`asString` at `Url` answers `href`:

```
>>> 'http://cern.ch/'.asUrl.asString
'http://cern.ch/'
```

_Note_:
The type has the non-standard spelling _URL_, which is defined by the system.

* * *

See also: asFileUrl, asUrl, fileName, fragment, href, host, hostName, Location, origin, pathName, protocol, query, UrlQueryParameters

References:
_RFC_
[1](https://www.rfc-editor.org/rfc/rfc1738.txt),
_Whatwg_
[1](https://url.spec.whatwg.org/)

Further Reading: Berners-Lee 1994

Categories: Network, Address

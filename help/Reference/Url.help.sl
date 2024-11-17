# Url

`Url` is both a `Trait` and a `Type` representing a _Uniform Resource Locator_.

`Url` values are constructed using `asUrl`.

`Url` implements the `fragment`, `host`, `hostName`, `href`, `origin`, `pathName`, `port`, `protocol` and `query` methods.

```
>>> let url = 'https://rohandrape.net/?t=spl&e=help/Reference/Url.help.sl'.asUrl;
>>> (url.protocol, url.hostName, url.pathName, url.search)
('https:', 'rohandrape.net', '/', '?t=spl&e=help/Reference/Url.help.sl')
```

_Note_:
The type has the non-standard spelling _URL_, which is defined by the system.

* * *

See also: asFileUrl, asUrl, fileName, fragment, href, host, hostName, Location, origin, pathName, protocol, query, UrlQueryParameters

References:
_Whatwg_
[1](https://url.spec.whatwg.org/)

Further Reading: Berners-Lee 1994

Categories: Network, Address

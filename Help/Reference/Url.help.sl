# Url

- _Url(u, b)_

`Url` is both a `Trait` and a `Type` representing a _Uniform Resource Locator_.
`Url` values are constructed from an address string _u_ and optionally a base address string _b_.

`Url` implements the
`fragment`,
`host` (also called domain),
`hostName`,
`href`,
`origin`,
`pathName`,
`port`,
`protocol` (also called scheme)
and `query` methods.

Component queries:

```
>>> Url('http://cern.ch/').hostName
'cern.ch'

>>> Url('http://cern.ch:8080/').port
'8080'

>>> Url('http://cern.ch/').protocol
'http:'

>>> Url('http://cern.ch/#home').fragment
'#home'
```

Deconstruct a `Url`:

```
>>> let url = Url('A://B:0/C?D=E#F');
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
>>> Url('http://cern.ch/').asString
'http://cern.ch/'
```

_Note_:
The type has the non-standard spelling _URL_, which is defined by the system.

* * *

See also: asFileUrl, asUrl, fileName, fragment, href, host, hostName, Location, origin, pathName, protocol, query, UrlQueryParameters

Guides: Network Functions

References:
_Ietf_
[1](https://www.rfc-editor.org/rfc/rfc1738.txt),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/URL.html),
_Whatwg_
[1](https://url.spec.whatwg.org/)

Further Reading: Berners-Lee 1994

Categories: Network, Address

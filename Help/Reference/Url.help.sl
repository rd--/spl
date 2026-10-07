# Url

- _Url(u, b='')_

`Url` is both a `Trait` and a `Type` representing a _Uniform Resource Locator_.
`Url` values are constructed from an address string _u_ and optionally a base address string _b_.

Construct a `Url` from the string _s_, with base _b_.

At `String`:

```
>>> let u = Url'http://cern.ch/';
>>> (u.isUrl, u, u.href)
(
	true,
	Url'http://cern.ch/',
	'http://cern.ch/'
)
```

With base `Url`:

```
>>> Url(
>>> 	'rfc/rfc1738.txt',
>>> 	'http://rfc-editor.org/'
>>> )
Url'http://rfc-editor.org/rfc/rfc1738.txt'
```

At `Url`:

```
>>> let u = Url'file:///etc/fstab';
>>> Url(u) == u
true
```

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
>>> Url'http://cern.ch/'.hostName
'cern.ch'

>>> Url'http://cern.ch:8080/'.port
'8080'

>>> Url'http://cern.ch/'.protocol
'http:'

>>> Url'http://cern.ch/#home'.fragment
'#home'
```

Deconstruct a `Url`:

```
>>> let url = Url'A://B:0/C?D=E#F';
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

Binary form:

```
>>> Url('a', 'http://x')
Url'http://x/a'

>>> Url('a', 'file://')
Url'file:///a'
```

`printString` at `Url`:

```
>> Url'http://cern.ch/'.printString
Url('http://cern.ch/')
```

_Note_:
The type has the non-standard spelling _URL_, which is defined by the system.

* * *

See also: Location, UrlQueryParameters, fileUrl, fileName, fragment, href, host, hostName, origin, pathName, protocol, query

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

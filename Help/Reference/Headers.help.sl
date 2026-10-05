# Headers

- _Headers(r)_

A `Type` holding  Http request and response headers.

At `Record`,
all keys must be valid and all values must be of type `String`:

```
>>> let h = Headers(
>>> 	'Content-Type': 'image/png'
>>> );
>>> (
>>> 	h['Content-type'],
>>> 	Record(h)
>>> )
(
	'image/png',
	('content-type': 'image/png')
)
```

Implements a subset of the `Dictionary` protocol:
`at`, `atIfAbsent`, `includesKey`, `put`, `Record`, `removeKey`.

Key queries are case insensitive.

* * *

See also: Record, Response

Categories: Network

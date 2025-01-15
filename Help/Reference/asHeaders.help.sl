# asHeaders

- _asHeaders(aRecord)_

Convert a `Record` to a `Headers` value.
All keys must be valid and all values must be of type `String`.

```
>>> let headers = (
>>> 	'Content-Type': 'image/png'
>>> ).asHeaders;
>>> (
>>> 	headers['Content-type'],
>>> 	headers.asRecord
>>> )
(
	'image/png',
	('content-type': 'image/png')
)
```

* * *

See also: asRecord, Headers, Response

Categories: Network

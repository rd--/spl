# Response

- _Response(body, options)_

A `Response` is a `Type` that is the promised answer to a `fetch` request.

Implements `binaryLargeObject`, `byteArray`, `json` and `text` methods to retrieve the held value as a further `Promise`.

Implements `headers` to retrieve any associated Http headers.
The `contentType` method at `Headers` can be used to get the 'Content-Type' field.

```
>>> let r = Response(
>>> 	'Plain text',
>>> 	(
>>> 		status: 200,
>>> 		headers: (
>>> 			'Content-Type': 'text/plain'
>>> 		)
>>> 	)
>>> );
>>> (
>>> 	r.body.isReadableStream,
>>> 	r.bodyUsed,
>>> 	r.headers.contentType,
>>> 	r.status,
>>> 	r.type,
>>> 	r.ok
>>> )
(
	true,
	false,
	'text/plain',
	200,
	'default',
	true
)
```

* * *

See also: blob, byteArray, fetch, headers, Headers, json, Promise, text

Guides: Network Functions

References:
_Mdn_
[1](https://developer.mozilla.org/en-US/docs/Web/API/Response),
_Whatwg_
[1](https://fetch.spec.whatwg.org/#response-class)

Categories: Network, Type

# Response

A `Response` is a `Type` that is the promised answer to a `fetch` request.

Implements `blob`, `byteArray`, `json` and `text` methods to retrieve the held value as a further `Promise`.

Implements `headers` to retrieve any associated Http headers,
and `contentType` to get the 'Content-Type' field of `headers`.

```
>>> Response('!').isResponse
true
```

* * *

See also: blob, byteArray, fetch, headers, Headers, json, Promise, text

References:
_Mdn_
[1](https://developer.mozilla.org/en-US/docs/Web/API/Response),
_Whatwg_
[1](https://fetch.spec.whatwg.org/#response-class)

Categories: Network, Type

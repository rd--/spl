# BinaryLargeObject

- _BinaryLargeObject([b₁ b₂ …], o)_

A `BinaryLargeObject` is both a `Trait` and an opaque `Type` holding immutable binary data.
A `BinaryLargeObject` represents a "Binary Large Object".
The constructor takes a list of `ByteArray` values _b_ and a `Record` of options _o_.

`BinaryLargeObject` joins multiple parts together:

```
>>> let x = BinaryLargeObject(
>>> 	[1:5, 6:9].collect(
>>> 		asByteArray:/1
>>> 	),
>>> 	(
>>> 		type:
>>> 		'application/octet-stream'
>>> 	)
>>> );
>>> (x.size, x.type)
(9, 'application/octet-stream')
```

The `type` of a `BinaryLargeObject` is the _mime type_ of the resource,
if known,
else the empty string.

~~~spl async
[65 .. 69]
.asByteArray
.asBinaryLargeObject
.text
~~~

`BinaryLargeObject` implements the methods:

- `arrayBuffer`
- `isEmpty`
- `size`
- `text`
- `type`

`arrayBuffer` and `text` both answer `Promise` values.

* * *

See also: arrayBuffer, asBinaryLargeObject, File, size, text, type

References:
_Iana_
[1](https://www.iana.org/assignments/media-types/media-types.xhtml),
_Ietf_
[1](https://datatracker.ietf.org/doc/html/rfc6838),
_W3c_
[1](https://w3c.github.io/FileAPI/#blob-section)

Categories: System, Trait, Type

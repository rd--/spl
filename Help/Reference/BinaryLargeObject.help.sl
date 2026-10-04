# BinaryLargeObject

- _BinaryLargeObject([b₁ b₂ …], o)_

A `BinaryLargeObject` is both a `Trait` and an opaque `Type` holding immutable binary data,
sometimes abbreviated as _blob_.
A `BinaryLargeObject` represents a "Binary Large Object".
The constructor takes a list of `ByteArray` values _b_ and a `Record` of options _o_.

At `ByteArray` encloses data:

```
>>> let x = ByteArray[1 .. 9];
>>> let b = BinaryLargeObject(x);
>>> (x.size, b.size, b.type)
(9, 9, '')
```

At `Float64Array` encloses data as a byte array:

```
>>> let x = Float64Array[1 .. 9];
>>> let b = BinaryLargeObject(x);
>>> (x.size, b.size, b.type)
(9, 72, '')
```

`BinaryLargeObject` joins multiple parts together:

```
>>> let x = BinaryLargeObject(
>>> 	[1:5, 6:9].collect(
>>> 		ByteArray/1
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

Interpret a byte vector as text,
the `type` is not known:

~~~spl async
ByteArray[65 .. 69]
.BinaryLargeObject
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

See also: arrayBuffer, File, size, text, type

References:
_Iana_
[1](https://www.iana.org/assignments/media-types/media-types.xhtml),
_Ietf_
[1](https://datatracker.ietf.org/doc/html/rfc6838),
_W3c_
[1](https://w3c.github.io/FileAPI/#blob-section)

Categories: System, Trait, Type

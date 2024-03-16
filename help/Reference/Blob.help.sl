# Blob

A `Blob` is both a `Trait` and an opaque `Type` holding immutable binary data.
A `Blob` represents a "Binary Large Object".

The `type` of a `Blob` is the _mime type_ of the resource,
if known,
else the empty string.

~~~
[65 .. 69].asByteArray.asBlob.text.then { :answer |
	(answer = 'ABCDE').postLine
}
~~~

Blob implements: `arrayBuffer`, `isEmpty`, `size`, `text` & `type`.
`arrayBuffer` and `text` both answer `Promise` values.

* * *

See also: arrayBuffer, asBlob, File, size, text, type

References:
_Iana_
[1](https://www.iana.org/assignments/media-types/media-types.xhtml),
_Ietf_
[1](https://datatracker.ietf.org/doc/html/rfc6838),
_W3c_
[1](https://w3c.github.io/FileAPI/#blob-section)

Categories: System, Trait, Type

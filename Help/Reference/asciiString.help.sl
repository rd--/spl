# asciiString

- _asciiString([b₁ b₂ …])_

Answer a `String` of the `ByteArray` or `List` _b_,
which must be an Ascii encoding.

```
>>> [97 115 99 105 105]
>>> .asciiString
'ascii'
```

Utf-8 is a superset of Ascii:

```
>>> [97 115 99 105 105]
>>> .utf8String
'ascii'
```

The inverses are `ascii` and `asciiByteArray`:

```
>>> 'ascii'.ascii
[97 115 99 105 105]

>>> 'ascii'.asciiByteArray
ByteArray[97 115 99 105 105]
```

* * *

See also: ByteArray, List, String, ascii, asciiByteArray, utf8String

Guides: String Functions

Categories: Converting, String, Encoding

# asciiString

- _asciiString([b₁ b₂ …])_

Answer a `String` of the `ByteArray` or `List` _b_,
which must be an Ascii encoding.

```
>>> [97 115 99 105 105]
>>> .asciiString
'ascii'
```

The inverses are `ascii` and `asciiByteArray`:

```
>>> 'ascii'.ascii.asciiString
'ascii'

>>> 'ascii'
>>> .asciiByteArray
>>> .asciiString
'ascii'
```

* * *

See also: ascii, asciiByteArray, ByteArray, String

Guides: String Functions

Categories: Converting, String, Encoding

# asciiString

- _asciiString(aByteArray | aList)_

Answer a `String` of _aByteArray_ or _aList_,
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

Categories: Converting, String, Encoding

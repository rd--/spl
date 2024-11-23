# asciiString

- _asciiString(aByteArray)_

Answer a `String` of _aByteArray_ which must be an Ascii encoding.

```
>>> let bytes = [97 115 99 105 105].asByteArray;
>>> bytes.asciiString
'ascii'
```

The inverse is `asciiByteArray`:

```
>>> let bytes = 'ascii'.asciiByteArray;
>>> bytes.asciiString
'ascii'
```

* * *

See also: asciiByteArray, ByteArray, String

Categories: Converting, String, Encoding

# parseHexString

- _parseHexString(aString)_

Answer a `ByteArray` encoded in hexadecimal at _aString_.

```
>>> '0F00F010'
>>> .parseHexString
[15 0 240 16].asByteArray
```

Decode a hexadecimal encoding of an Ascii encoding of a `String`:

```
>>> '737472696E67'
>>> .parseHexString
>>> .asciiString
'string'
```

* * *

See also: asByteArray, asciiString, asHexString, base64Decoded

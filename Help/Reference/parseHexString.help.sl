# parseBase16

- _parseBase16(aString)_

Answer a `ByteArray` encoded in hexadecimal at _aString_.

```
>>> '0F00F010'
>>> .parseBase16
[15 0 240 16].asByteArray
```

Decode a hexadecimal encoding of an Ascii encoding of a `String`:

```
>>> '737472696E67'
>>> .parseBase16
>>> .asciiString
'string'
```

* * *

See also: asByteArray, asciiString, asHexString, base64Decoded

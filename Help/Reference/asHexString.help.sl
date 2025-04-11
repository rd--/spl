# asHexString

- _asHexString(aByteArray | aString)_

Answer the two character per byte hexadecimal encoding of _aByteArray_,
or of the Ascii encoding of _aString_.

At `ByteArray`:

```
>>> [9 .. 15].asByteArray
>>> .asHexString
'090A0B0C0D0E0F'
```

At `ByteArray` of the Ascii encoding of a `String`:

```
>>> 'string'.asciiByteArray
>>> .asHexString
'737472696E67'
```

At `String`:

```
>>> 'hexadecimal'.asHexString
'68657861646563696D616C'

>>> 'Ascii'.asHexString
'4173636969'
```

Radix notation of list:

```
>>> 'Ascii'.asciiByteArray.asList
[16r41 16r73 16r63 16r69 16r69]
```

At `AsciiString`:

```
>>> 'Ascii'.asAsciiString.asHexString
'4173636969'.asAsciiString
```

* * *

See also: asciiByteArray, AsciiString, asHexDigit, base64Encoded, parseHexString, String

Categories: Converting

# base16Encoded

- _base16Encoded(aByteArray)_

Answer _aByteArray_ encoded as a Base-16 `String`.

At `ByteArray`:

```
>>> [9 .. 15].asByteArray
>>> .base16Encoded
'090A0B0C0D0E0F'
```

At `ByteArray` of the Ascii encoding of a `String`:

```
>>> 'string'.asciiByteArray
>>> .base16Encoded
'737472696E67'
```

Radix notation of list:

```
>>> 'Ascii'.asciiByteArray.asList
[16r41 16r73 16r63 16r69 16r69]
```

* * *

See also: asciiByteArray, AsciiString, asHexDigit, base16Decoded, base64Encoded, String

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BaseEncode.html),
_RFC_
[1](https://datatracker.ietf.org/doc/html/rfc4648),
_W_
[1](https://en.wikipedia.org/wiki/Hexadecimal)

Categories: Converting

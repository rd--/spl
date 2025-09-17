# base16Encode

- _base16Encode(b)_

Answer the byte array _b_ encoded as a Base-16 `String`.

```
>>> [0 .. 15].asByteArray.base16Encode
'000102030405060708090A0B0C0D0E0F'

>>> [248 .. 255].asByteArray.base16Encode
'F8F9FAFBFCFDFEFF'
```

At `ByteArray`:

```
>>> [9 .. 15].asByteArray
>>> .base16Encode
'090A0B0C0D0E0F'
```

At `ByteArray` of the Ascii encoding of a `String`:

```
>>> 'string'.asciiByteArray
>>> .base16Encode
'737472696E67'
```

Radix notation of list:

```
>>> 'Ascii'.asciiByteArray.asList
[16r41 16r73 16r63 16r69 16r69]
```

* * *

See also: asciiByteArray, AsciiString, asHexDigit, base16Decode, base64Encode, String

References:
_Ietf_
[1](https://datatracker.ietf.org/doc/html/rfc4648),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BaseEncode.html),
_W_
[1](https://en.wikipedia.org/wiki/Hexadecimal)

Categories: Converting

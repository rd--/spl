# hexString

- _hexString(s)_

Answer the two character per byte hexadecimal encoding of the Ascii encoding of the string _s_.

At `String`:

```
>>> 'hexadecimal'.hexString
'68657861646563696D616C'

>>> 'Ascii'.hexString
'4173636969'

>>> 'Ascii'.asciiByteArray
>>> .base16Encode
'4173636969'
```

Radix notation of list:

```
>>> 'Ascii'.asciiByteArray
ByteArray[
	16r41 16r73 16r63 16r69 16r69
]
```

At `AsciiString`:

```
>>> AsciiString'Ascii'.hexString
AsciiString'4173636969'
```

* * *

See also: AsciiString, String, asciiByteArray, base16Decode, base16Encode, hexDigitCharacter

Guides: String Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Hexadecimal)

Categories: Converting

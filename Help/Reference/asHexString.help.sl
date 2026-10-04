# asHexString

- _asHexString(s)_

Answer the two character per byte hexadecimal encoding of the Ascii encoding of the string _s_.

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
>>> AsciiString'Ascii'.asHexString
AsciiString'4173636969'
```

* * *

See also: asciiByteArray, AsciiString, asHexDigit, base16Decode, base16Encode, String

Guides: String Functions

Categories: Converting

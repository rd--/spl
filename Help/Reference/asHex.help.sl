# asHex

- _asHex(aString)_

Answer a hex string encoding of the Ascii encoding of _aString_.

At `String`:

```
>>> 'Ascii'.asHex
'4173636969'
```

Radix notation of list:

```
>>> 'Ascii'.asciiByteArray.asList
[16r41 16r73 16r63 16r69 16r69]
```

At `AsciiString`:

```
>>> 'Ascii'.asAsciiString.asHex
'4173636969'.asAsciiString
```

* * *

See also: asciiByteArray, AsciiString, hex

Categories: Converting

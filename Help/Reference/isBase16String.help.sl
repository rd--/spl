# isBase16String

- _isBase16String(aString)_

Answer `true` if _aString_ represents a Base-16 encoded value.

```
>>> 'FF'.isBase16String
true

>>> '0123456789ABCDEF'
>>> .isBase16String
true
```

The letters _A-F_ must be written in upper case:

```
>>> 'ff'.isBase16String
false
```

The empty string answers `false`:

```
>>> ''.isBase16String
false
```

White space answers `false`:

```
>>> 'F '.isBase16String
false
```

To convert a Base-16 string to a `ByteArray` see `parseBase16`.

* * *

See also: asNumber, base16Decoded, base16Encoded, isBase64String, isBooleanString, isFloatString, isDecimalIntegerString, parseBase16

Guides: Parsing Functions

References:
_Ietf_
[1](https://datatracker.ietf.org/doc/html/rfc4648),
_W_
[1](https://en.wikipedia.org/wiki/Hexadecimal)

Categories: Testing

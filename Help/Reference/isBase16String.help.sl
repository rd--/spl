# isBase16String

- _isBase16String(aString)_

Answer `true` if _aString_ represents a Base-16 encoded value.
The letters _A-F_ must be written in upper case.

```
>>> 'FF'.isBase16String
true

>>> '0123456789ABCDEF'
>>> .isBase16String
true
```

The empty string answers `false`:

```
>>> ''.isBase16String
false
```

* * *

See also: asNumber, isBase64String, isBooleanString, isFloatString, isDecimalIntegerString

Guides: Parsing Functions

References:
_RFC_
[1](https://datatracker.ietf.org/doc/html/rfc4648)

Categories: Testing

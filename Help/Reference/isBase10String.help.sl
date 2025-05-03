# isBase10String

- _isBase10String(aString)_

Answer `true` if _aString_ represents a Base-10 encoded value.

```
>>> '99'.isBase10String
true

>>> '0123456789'
>>> .isBase10String
true
```

The empty string answers `false`:

```
>>> ''.isBase10String
false
```

* * *

See also: asNumber, isBase16String, isBase64String, isBooleanString, isFloatString, isDecimalIntegerString

Guides: Parsing Functions

References:
_RFC_
[1](https://datatracker.ietf.org/doc/html/rfc4648)

Categories: Testing

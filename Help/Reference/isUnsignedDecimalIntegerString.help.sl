# isUnsignedDecimalIntegerString

- _isUnsignedDecimalIntegerString(aString)_

Answer `true` if _aString_ represents an unsigned decimal integer.

```
>>> '99'.isUnsignedDecimalIntegerString
true

>>> '0123456789'
>>> .isUnsignedDecimalIntegerString
true
```

The empty string answers `false`:

```
>>> ''.isUnsignedDecimalIntegerString
false
```

* * *

See also: asNumber, isBooleanString, isFloatString, isDecimalIntegerString

Guides: Parsing Functions

Categories: Testing

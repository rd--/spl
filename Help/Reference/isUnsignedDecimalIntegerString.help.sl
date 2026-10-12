# isUnsignedDecimalIntegerString

- _isUnsignedDecimalIntegerString(s)_

Answer `true` if the string _s_ represents an unsigned decimal integer.

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

See also: Number, isBooleanString, isFloatString, isDecimalIntegerString

Guides: Parsing Functions

Categories: Testing

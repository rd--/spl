# isDecimalIntegerString

- _isDecimalIntegerString(aString)_

Answer true if _aString_ would be parsed as a floating point number by `parseDecimalInteger`.

This does not allow a zero fractional part,
i.e. one must write _23_ not _23.0_.

```
>>> '23'.isDecimalIntegerString
true

>>> '23.0'.isDecimalIntegerString
false

>>> '0123456789'
>>> .isDecimalIntegerString
true

>>> '3.141'.isDecimalIntegerString
false
```

The empty string answers `false`:

```
>>> ''.isDecimalIntegerString
false
```

* * *

See also: asNumber, isBooleanString, isFloatString, parseDecimalInteger

Categories: Testing

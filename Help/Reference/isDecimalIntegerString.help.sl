# isDecimalIntegerString

- _isDecimalIntegerString(aString)_

Answer `true` if _aString_ consists only of the decimal digits _0_ through _9_,
perhaps prefixed by a sign character, either _+_ or _-_.

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

An initial sign is allowed:

```
>>> '-23'.isDecimalIntegerString
true

>>> '+23'.isDecimalIntegerString
true
```

The empty string answers `false`:

```
>>> ''.isDecimalIntegerString
false
```

* * *

See also: asNumber, isBooleanString, isFloatString, parseDecimalInteger

References:
_W_
[1](https://en.wikipedia.org/wiki/Decimal)

Categories: Testing

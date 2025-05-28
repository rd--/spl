# isDecimalNumeralString

- _isDecimalNumeralString(aString)_

Answer `true` if _aString_ would be parsed as a floating point number by `parseDecimalNumeral`.

With decimal point:

```
>>> '23.0'.isDecimalNumeralString
true

>>> '01234.56789'
>>> .isDecimalNumeralString
true
```

Without decimal point:

```
>>> '23'.isDecimalNumeralString
true

>>> '0123456789'
>>> .isDecimalNumeralString
true
```

Does not allow _E_-notation:

```
>>> '2E3'.isDecimalNumeralString
false
```

The empty string answers `false`:

```
>>> ''.isDecimalNumeralString
false
```

* * *

See also: asNumber, isBooleanString, isFloatString, parseDecimalNumeral

References:
_W_
[1](https://en.wikipedia.org/wiki/Decimal)

Categories: Testing

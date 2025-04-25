# isHexadecimalIntegerString

- _isHexadecimalIntegerString(aString)_

Answer `true` if _aString_ represents a hexadecimal integer.
The letters _A-F_ must be written in upper case.

```
>>> 'FF'.isHexadecimalIntegerString
true

>>> '0123456789ABCDEF'
>>> .isHexadecimalIntegerString
true
```

The empty string answers `false`:

```
>>> ''.isHexadecimalIntegerString
false
```

* * *

See also: asNumber, isBooleanString, isFloatString, isDecimalIntegerString

Categories: Testing

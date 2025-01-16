# isFloatString

- _isFloatString(aString)_

Answer true if _aString_ would be parsed as a floating point number by `parseNumber`.

This does not allow missing integral or fractional parts,
i.e. one must write _0.23_ not _.23_ and _23.0_ not _23._.

```
>>> '23'.isFloatString
true

>>> '3.141'.isFloatString
true
```

The input string must not be empty.

* * *

See also: asNumber, isDecimalIntegerString, parseNumber, RegExp

Categories: Testing

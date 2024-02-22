# isDecimalIntegerString

- isDecimalIntegerString_(aString)_

Answer true if _aString_ would be parsed as a floating point number by `parseDecimalInteger`.

This does not allow missing a zero fractional part,
i.e. one must write _23_ not _23.0_.

```
>>> '23'.isDecimalIntegerString
true

>>> '3.141'.isDecimalIntegerString
false
```

The input string must not be empty.

* * *

See also: asNumber, isFloatString, parseDecimalInteger

Categories: Testing

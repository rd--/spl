# isDecimalIntegerString -- testing

- isDecimalIntegerString_(aString)_

Answer true if _aString_ would be parsed as a floating point number by _parseDecimalInteger_.

This does not allow missing a zero fractional part,
i.e. one must write _23_ not _23.0_.

The input string must not be empty.

* * *

See also: asNumber, isFloatString, parseDecimalInteger

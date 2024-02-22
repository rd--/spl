# parseInteger

- _parseInteger(aString, radix)_

Answer the SmallFloat of the integer indicated by _aString_ which must be in _radix_ notation.
If the string is not an integer, signal an error.

```
>>> '23'.parseInteger(10)
23

>>> '-23'.parseInteger(10)
-23

>>> '1001'.parseInteger(2)
9

>>> '10101'.parseInteger(2)
21

>>> '11'.parseInteger(16)
17

>>> 'FF'.parseInteger(16)
255
```

* * *

See also: parseDecimalInteger

Categories: Parsing

# parseDecimalNumeral

- _parseDecimalNumeral(aString, elseClause:/0)_

Parse the decimal numeral at _aString_.

With decimal point:

```
>>> '23.0'.parseDecimalNumeral
23.0

>>> '01234.56789'
>>> .parseDecimalNumeral
01234.56789
```

Without decimal point:

```
>>> '23'.parseDecimalNumeral
23

>>> '0123456789'
>>> .parseDecimalNumeral
0123456789
```

With signs:

```
>>> '-3.141'.parseDecimalNumeral
-3.141

>>> '+1.618'.parseDecimalNumeral
1.618
```

The empty string cannot be parsed:

```
>>> ''.parseDecimalNumeral { nil }
nil
```

* * *

See also: asNumber, isBooleanString, isDecimalNumeralString, parseDecimalInteger

References:
_W_
[1](https://en.wikipedia.org/wiki/Decimal)

Categories: Testing

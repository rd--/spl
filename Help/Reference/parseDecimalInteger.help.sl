# parseDecimalInteger

- _parseDecimalInteger(aString)_

Answer the `SmallFloat` of the decimal integer indicated by _aString_,
which must be in decimal notation.
If the string is not a decimal integer, signal an error.

```
>>> '23'.parseDecimalInteger
23
```

Parses negative numbers:

```
>>> '-23'.parseDecimalInteger
-23
```

Does not parse radix notation,
signals `error` on failure:

```
>>> {
>>> 	'10r9'.parseDecimalInteger
>>> }.ifError { true }
true

>>> 10r9
2r1001
```

* * *

See also: asInteger, parseDecimal, parseLargeInteger, parseNumber, parseSmallInteger

Guides: Parsing Functions

Categories: Parsing

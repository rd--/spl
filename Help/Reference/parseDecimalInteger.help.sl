# parseDecimalInteger

- _parseDecimalInteger(aString)_
- _parseDecimalInteger(aString, elseClause:/0)_

Answer the `SmallFloat` of the decimal integer indicated by _aString_,
which must be in decimal notation.
If the string is not a decimal integer,
evaluate _elseClause_ or signal an `error`.

```
>>> '23'.parseDecimalInteger
23
```

Does not allow a zero fractional part:

```
>>> '23.0'.parseDecimalInteger { nil }
nil
```

Parses negative numbers, a positive sign is also allowed:

```
>>> '-23'.parseDecimalInteger
-23

>>> '+23'.parseDecimalInteger
23
```

Cannot parse the empty string:

```
>>> ''.parseDecimalInteger { nil }
nil
```

Does not parse radix notation,
with no else clause signals `error` on failure:

```
>>> {
>>> 	'10r9'.parseDecimalInteger
>>> }.hasError
true

>>> 10r9
2r1001
```

* * *

See also: asInteger, isDecimalIntegerString, parseDecimal, parseLargeInteger, parseNumber, parseSmallInteger

Guides: Parsing Functions

Categories: Parsing

# parseDecimalInteger

- _parseDecimalInteger(s, f/0)_

Answer the `Float` of the decimal integer indicated by the string _s_,
which must be in decimal notation.
If the string is not a decimal integer,
evaluate the else clause _f_ or signal an `error`.

```
>>> '23'.parseDecimalInteger
23L
```

Does not allow a zero fractional part:

```
>>> '23.0'.parseDecimalInteger { nil }
nil
```

Parses negative numbers,
a positive sign is also allowed:

```
>>> '-23'.parseDecimalInteger
-23L

>>> '+23'.parseDecimalInteger
23L
```

Cannot parse the empty string:

```
>>> ''.parseDecimalInteger { nil }
nil
```

Does not parse radix notation,
see `parseSmallInteger`,
with no else clause signals `error` on failure:

```
>>> {
>>> 	'10b9'.parseDecimalInteger
>>> }.hasError
true

>>> 10b9
2b1001
```

* * *

See also: asInteger, isDecimalIntegerString, parseDecimal, parseInteger, parseNumber, parseSmallInteger

Guides: Parsing Functions

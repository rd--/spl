# parseDecimalInteger

- _parseDecimalInteger(aString)_

Answer the `SmallFloat` of the decimal integer indicated by _aString_,
which must be in decimal notation.
If the string is not a decimal integer, signal an error.

```
>>> '23'.parseDecimalInteger
23
```

Signal `error` on failure:

```
>>> { 'three'.parseDecimalInteger }.ifError { true }
true
```

* * *

See also: asInteger, parseInteger, parseNumber

Categories: Parsing

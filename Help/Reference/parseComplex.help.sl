# parseComplex

- _parseComplex(aString)_
- _parseComplex(aString, elseClause:/0)_

Answer the `Complex` number represented by _aString_,
else evaluate _elseClause_ or signal an `error`.

Parse integral complex number:

```
>>> '3J4'.parseComplex
3J4
```

Parse fractional complex number:

```
>>> '3.141J1.618'.parseComplex
3.141J1.618
```

Signal an `error` if _aString_ is not a complex number:

```
>>> '23'.parseComplex { nil }
nil

>>> {
>>> 	'3.141'.parseComplex
>>> }.ifError { true }
true
```

* * *

See also: Complex, parseDecimal, parseLargeInteger, parseNumber, parseSmallInteger

Guides: Parsing Functions

Categories: Converting, Parsing

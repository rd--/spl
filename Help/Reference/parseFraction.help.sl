# parseFraction

- _parseFraction(aString)_
- _parseFraction(aString, elseClause:/0)_

Answer the `Fraction` represented by _aString_,
using a solidus to delimit the numerator and denominator,
else evaluate _elseClause_ or signal an `error`.

Parse fraction:

```
>>> '3/4'.parseFraction
3/4
```

Parse large fractions:

```
>>> '18014398509481983/23'.parseFraction
2L ^ 54 - 1 / 23
```

Signal an `error` if _aString_ is not a fraction:

```
>>> '3.141'.parseFraction { nil }
nil

>>> {
>>> 	'3.141'.parseFraction
>>> }.hasError
true
```

* * *

See also: Fraction, parseDecimal, parseLargeInteger, parseNumber, parseSmallInteger

Guides: Parsing Functions

Categories: Converting, Parsing

# parseFraction

- _parseFraction(s, f:/0)_

Answer the `Fraction` represented by the string _s_,
using a solidus to delimit the numerator and denominator,
else evaluate the else clause _f_ or signal an `error`.

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

Signal an `error` if the string _s_ is not a fraction:

```
>>> '3.141'.parseFraction { nil }
nil

>>> {
>>> 	'3.141'.parseFraction
>>> }.hasError
true
```

At `Record`:

```
>>> (numerator: 2, denominator: 3)
>>> .parseFraction
2/3

>>> 2/3.asRecord
(numerator: 2, denominator: 3)
```

* * *

See also: Fraction, parseDecimal, parseLargeInteger, parseNumber, parseSmallInteger

Guides: Parsing Functions

Categories: Converting, Parsing
